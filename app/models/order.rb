class Order < ActiveRecord::Base
  include Workflow

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :restaurant
  belongs_to :address

  workflow do
    state :ready_for_prep do
      event :in_queue, :transitions_to => :in_preparation
      event :cancel, :transitions_to => :cancelled
    end

    state :in_preparation do
      event :order_processed, :transitions_to => :ready_for_delivery
    end

    state :ready_for_delivery do
      event :order_enroute, :transitions_to => :out_for_delivery
    end

    state :out_for_delivery do
      event :complete, :transitions_to => :delivered
    end
    state :cancelled
    state :delivered
  end

  def self.ready_for_prep
    self.with_ready_for_prep_state
  end

  def self.cancelled
    self.with_cancelled_state
  end

  def self.in_preparation
    self.with_in_preparation_state
  end

  def self.ready_for_delivery
    self.with_ready_for_delivery_state
  end

  def self.out_for_delivery
    self.with_out_for_delivery_state
  end

  def self.delivered
    self.with_delivered_state
  end

  def pay_in_store?
    ccn.nil? && expdate.nil?
  end

  def add_item(item)
    if self.items.include?(item)
      access_order_item(item).increment!(:quantity)
    else
      self.items << item
    end
  end

  def remove_item(item)
    self.items.delete(item)
  end

  def empty?
    items.empty?
  end

  def total
    order_items.reduce(0) do |sum, order_item|
      sum += order_item.quantity * order_item.item.price
    end
  end

  def total_for_humans
    sprintf("%.2f",(total.to_f/100))
  end

  def tax
    total * 0.08
  end

  def tax_for_humans
    sprintf("%.2f",(tax.to_f/100))
  end

  def total_price
    total + tax
  end

  def total_price_for_humans
    sprintf("%.2f",(total_price.to_f/100))
  end

  def arrival_time
    (updated_at + 45.minutes).strftime('%l:%M %p')
  end

  private

  def access_order_item(item)
    self.order_items.where(item_id: item.id).first
  end
end
