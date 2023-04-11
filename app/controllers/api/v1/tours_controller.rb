# frozen_string_literal: true

class Api::V1::ToursController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy,]

  # 2) Pero para crear, actualizar y eliminar si necesitamos autorizacion
  # 3) Solo los usuarios con role 'guia' y 'admin' pueden crear, actualizar y eliminar
  # 4) yo creo un tour, y solamente yo lo puedo editar, y otro usuario con guia
  def index
    @tours = Tour.all
    render json: { index: @tours }
  end

  def show
    @tours = Tour.all
    render json: { show: @tours }
  end

  def create
  end

  def update
  end

  def destroy
  end
end
