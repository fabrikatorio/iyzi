module Iyzi
  module PkiBuilders
    class CheckoutForm < PkiBuilder
      ATTRIBUTES_ORDER = %w{
        locale
        conversationId
        price
        basketId
        paymentGroup
        buyer
        shippingAddress
        billingAddress
        basketItems
        callbackUrl
        paymentSource
        posOrderId
        paidPrice
        forceThreeDS
        cardUserKey
      }.freeze

      TYPE_CAST = {
        default: 'add',
        price:   'add_price',
        buyer:   'add_buyer',
        shippingAddress: 'add_address',
        billingAddress: 'add_address',
        basketItems: 'add_basket_items',
        paidPrice: 'add_price'
      }.freeze

      def initialize(values = {})
        super({})
        Assigner.assign_params_by_order(self, ATTRIBUTES_ORDER, values)
      end

      def type_cast_hash
        TYPE_CAST
      end
    end
  end
end