Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB92F3CA1
	for <lists.iommu@lfdr.de>; Wed, 13 Jan 2021 00:48:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 403A084C2C;
	Tue, 12 Jan 2021 23:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBI5jRnn39YP; Tue, 12 Jan 2021 23:48:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA98184B65;
	Tue, 12 Jan 2021 23:48:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F79EC013A;
	Tue, 12 Jan 2021 23:48:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77CB3C013A
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 23:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5600720436
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 23:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2OGHI1mWOaA for <iommu@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 23:48:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by silver.osuosl.org (Postfix) with ESMTPS id 223CA20418
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 23:48:28 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id v19so233136pgj.12
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZruxYcBQXCXWok/YmCXjga0Z3PUTOQ6pNhSzq4bpJR4=;
 b=g0a+XeY1WpelCJ57IOHLZ5ClC3bxDfY0fE91b/U+a2JYIHKaMmcVwduCeAlYvDQQoL
 xjVCiINgK4qb5c/LcNp+C22h/uUgi0vdQ2TGhNzY6s+CaSrHxAQGfwwzQ0rH8W+88b31
 +XIJb8l5Nq1FsvPziTU9NZKAoS+c5TQjnwVX/6Eb1twaMPfwDQB6B2io0xNovCRZS7Ij
 F7Je6GW1bm2Mx6XSiUeKYKWTmiprOX72+CStoB8qTs5qJrO8vTUdnJMoWGnoJdNzQpBe
 moohYHc39LCcIAkyfVB+kDMXKifn7ejJk+tALEXkSKv8wCTdSj3tqESBUNBzgPdtMQj4
 jzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZruxYcBQXCXWok/YmCXjga0Z3PUTOQ6pNhSzq4bpJR4=;
 b=dLC4SU6VCKpcletB6KwaZBCdJywMIzUzN3P1io+4bnugpMcHJvHxMaz8Gi5Njx7spm
 dWwVwJsnN9LU6N1RnCeF4+oE41c+UlQHJFjhAnDXdHHMErKS40OFgEqPbv6oB9i3wvoD
 I15HzJ/15yKkorACwN3Jru6E0B2JV299vSIOdXYH2swIrgRTbyKGVasYzhlni/imZqgT
 7PjEX57vN3Kw1rPY1DR3qmrpx48mphd5l+xmg+B8fDyMvLYQtQvewcEtoTE7C1ynhpzN
 kGXxA9/7o3a07jNxK3ZTz43XJwoX7amLkp0sgmqu7u889vFiKb2/h1T5A4mmqOxaQxc/
 Fc0A==
X-Gm-Message-State: AOAM533G63NPxLdr5FyQka8S3KVd0tn4fBtCbHxHY8Jjzl2O7FauWFMx
 iOWA2ZD9zKDUexl8mIMhRLo=
X-Google-Smtp-Source: ABdhPJzcsesZOG8VoM+izCkYUl4yjaLgepIotHJQF1QgVivbf7byOhsDdoAO8dQh9VGDhIePy7ZM6A==
X-Received: by 2002:a63:1865:: with SMTP id 37mr1523162pgy.206.1610495307478; 
 Tue, 12 Jan 2021 15:48:27 -0800 (PST)
Received: from [10.67.48.230] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id k3sm57763pgm.94.2021.01.12.15.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 15:48:26 -0800 (PST)
Subject: Re: [RFC PATCH v3 6/6] of: Add plumbing for restricted DMA pool
To: Claire Chang <tientzu@chromium.org>, robh+dt@kernel.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 joro@8bytes.org, will@kernel.org, frowand.list@gmail.com,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-7-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <95e6dd76-5e18-e445-c351-19fba18f36de@gmail.com>
Date: Tue, 12 Jan 2021 15:48:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210106034124.30560-7-tientzu@chromium.org>
Content-Language: en-US
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, saravanak@google.com, peterz@infradead.org,
 xypron.glpk@gmx.de, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, bgolaszewski@baylibre.com,
 iommu@lists.linux-foundation.org, grant.likely@arm.com, rdunlap@infradead.org,
 gregkh@linuxfoundation.org, xen-devel@lists.xenproject.org,
 dan.j.williams@intel.com, treding@nvidia.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 1/5/21 7:41 PM, Claire Chang wrote:
> If a device is not behind an IOMMU, we look up the device node and set
> up the restricted DMA when the restricted-dma-pool is presented.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---

[snip]

> +int of_dma_set_restricted_buffer(struct device *dev)
> +{
> +	struct device_node *node;
> +	int count, i;
> +
> +	if (!dev->of_node)
> +		return 0;
> +
> +	count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> +						sizeof(phandle));

You could have an early check for count < 0, along with an error
message, if that is deemed useful.

> +	for (i = 0; i < count; i++) {
> +		node = of_parse_phandle(dev->of_node, "memory-region", i);
> +		if (of_device_is_compatible(node, "restricted-dma-pool"))

And you may want to add here an of_device_is_available(node). A platform
that provides the Device Tree firmware and try to support multiple
different SoCs may try to determine if an IOMMU is present, and if it
is, it could be marking the restriced-dma-pool region with a 'status =
"disabled"' property, or any variant of that scheme.

> +			return of_reserved_mem_device_init_by_idx(
> +				dev, dev->of_node, i);

This does not seem to be supporting more than one memory region, did not
you want something like instead:

		ret = of_reserved_mem_device_init_by_idx(...);
		if (ret)
			return ret;

> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index aedfaaafd3e7..e2c7409956ab 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -182,6 +182,10 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>  	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>  
>  	dev->dma_range_map = map;
> +
> +	if (!iommu)
> +		return of_dma_set_restricted_buffer(dev);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index d9e6a324de0a..28a2dfa197ba 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -161,12 +161,17 @@ struct bus_dma_region;
>  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
>  int of_dma_get_range(struct device_node *np,
>  		const struct bus_dma_region **map);
> +int of_dma_set_restricted_buffer(struct device *dev);
>  #else
>  static inline int of_dma_get_range(struct device_node *np,
>  		const struct bus_dma_region **map)
>  {
>  	return -ENODEV;
>  }
> +static inline int of_dma_get_restricted_buffer(struct device *dev)
> +{
> +	return -ENODEV;
> +}
>  #endif
>  
>  #endif /* _LINUX_OF_PRIVATE_H */
> 


-- 
Florian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
