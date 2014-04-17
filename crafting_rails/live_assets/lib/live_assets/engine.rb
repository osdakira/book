module LiveAssets
  class Engine < ::Rails::Engine
    paths["app/controllers"] = ["lib/controllers"]
  end
end
