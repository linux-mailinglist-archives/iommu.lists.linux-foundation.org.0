Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AD44D460020
	for <lists.iommu@lfdr.de>; Sat, 27 Nov 2021 17:18:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83E1480B4E;
	Sat, 27 Nov 2021 16:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oj6etVi1hdmw; Sat, 27 Nov 2021 16:18:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9BFF580B24;
	Sat, 27 Nov 2021 16:18:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D29EC000A;
	Sat, 27 Nov 2021 16:18:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FF60C000A
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 16:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F01E402F3
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 16:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9dLry_whlVc for <iommu@lists.linux-foundation.org>;
 Sat, 27 Nov 2021 16:18:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03757401C4
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638029913;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kP9G5nOumtKjxrGUQQJElSXHdsDYmsWeOL5Vc10tFp8=;
 b=JeZYRbuaorxwqgd7Q4/YKLbe6mWsPrBVbI41EJN3t0Krpaxt6eRH8xwcxBZB6oJ3oc2bgr
 r/s5B5QEMDqIfX1KciKt6wyb5qGsmn8FY3K5eHH+9ftEBLr8R3KUl2p5kHqope/WVAXA3L
 sH9ZccFQ3XVe1Rsw+q3VKVj6yYbb4mM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-33kTQWzSPN62qtqblMT7kw-1; Sat, 27 Nov 2021 11:18:32 -0500
X-MC-Unique: 33kTQWzSPN62qtqblMT7kw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso4208340wms.1
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 08:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=kP9G5nOumtKjxrGUQQJElSXHdsDYmsWeOL5Vc10tFp8=;
 b=1VWaHvpEZ4g6/atgkGSgMgabxTwR3Jh733yKXBbzOWE3TRdoSbRUN0v0B9WFaaz42W
 YeuNwx75oZJ7RrBQ2jDTc5siH1KroIY9GmS5WPdpp5urWgZCVUY9ivvRkWFB/Npr7gUd
 307oR28ojjQwFQ0C4UJtL8v/71KbzAgf0EIATTMflZHfAwwcDgmEgwZy/fCc8pdxTx6T
 gB37PXmem0dx/xppvmhJHHLh1x/CUPetCNpQbrm56J/LNNlulROaO1ZKBEFutMm5a9vR
 BJNsC+ZBpaxvSDy2ZExsw8msRDAEOwe/uCiDifX2DYzgUBeHo+JEbOf1R1GsOLREpWYO
 +q5A==
X-Gm-Message-State: AOAM532+3gPFIGd44rW2eKyvjq93R/6HVokiYO8tZcqpCU3YFMR/2DnQ
 DoB1UBCW+VOiWyae90hEz0EndpO4U8Oyiy8NZ1NJjr9OBbLiqlziW3dHtzejF8u6h4l9gWKIPid
 0lIiRBUbtn69ub85zhCywmu7RxxTf6g==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr21220526wrr.385.1638029910828; 
 Sat, 27 Nov 2021 08:18:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytZwHqxY+KvXMZhaFZl21+/JpV13hJPqRL/1UC79cwtAyf0HQ7txFbJs99R25+hd9EGf2Tfg==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr21220508wrr.385.1638029910605; 
 Sat, 27 Nov 2021 08:18:30 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id bd18sm9210802wmb.43.2021.11.27.08.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Nov 2021 08:18:29 -0800 (PST)
Subject: Re: [PATCH v2 2/5] iommu/virtio: Support bypass domains
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, joro@8bytes.org,
 will@kernel.org, mst@redhat.com, jasowang@redhat.com
References: <20211123155301.1047943-1-jean-philippe@linaro.org>
 <20211123155301.1047943-3-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <fd03ac99-9bd4-197b-26c8-dcc5de1b3057@redhat.com>
Date: Sat, 27 Nov 2021 17:18:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211123155301.1047943-3-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kevin.tian@intel.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com
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
Reply-To: eric.auger@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jean,

On 11/23/21 4:52 PM, Jean-Philippe Brucker wrote:
> The VIRTIO_IOMMU_F_BYPASS_CONFIG feature adds a new flag to the ATTACH
> request, that creates a bypass domain. Use it to enable identity
> domains.
>
> When VIRTIO_IOMMU_F_BYPASS_CONFIG is not supported by the device, we
> currently fail attaching to an identity domain. Future patches will
> instead create identity mappings in this case.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/virtio-iommu.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 80930ce04a16..ee8a7afd667b 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -71,6 +71,7 @@ struct viommu_domain {
>  	struct rb_root_cached		mappings;
>  
>  	unsigned long			nr_endpoints;
> +	bool				bypass;
>  };
>  
>  struct viommu_endpoint {
> @@ -587,7 +588,9 @@ static struct iommu_domain *viommu_domain_alloc(unsigned type)
>  {
>  	struct viommu_domain *vdomain;
>  
> -	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
> +	if (type != IOMMU_DOMAIN_UNMANAGED &&
> +	    type != IOMMU_DOMAIN_DMA &&
> +	    type != IOMMU_DOMAIN_IDENTITY)
>  		return NULL;
>  
>  	vdomain = kzalloc(sizeof(*vdomain), GFP_KERNEL);
> @@ -630,6 +633,17 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
>  	vdomain->map_flags	= viommu->map_flags;
>  	vdomain->viommu		= viommu;
>  
> +	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
> +		if (!virtio_has_feature(viommu->vdev,
nit: couldn't the check be done before the ida_alloc_range(),
simplifying the failure cleanup?

Thanks

Eric
> +					VIRTIO_IOMMU_F_BYPASS_CONFIG)) {
> +			ida_free(&viommu->domain_ids, vdomain->id);
> +			vdomain->viommu = 0;
> +			return -EOPNOTSUPP;
> +		}
> +
> +		vdomain->bypass = true;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -691,6 +705,9 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		.domain		= cpu_to_le32(vdomain->id),
>  	};
>  
> +	if (vdomain->bypass)
> +		req.flags |= cpu_to_le32(VIRTIO_IOMMU_ATTACH_F_BYPASS);
> +
>  	for (i = 0; i < fwspec->num_ids; i++) {
>  		req.endpoint = cpu_to_le32(fwspec->ids[i]);
>  
> @@ -1132,6 +1149,7 @@ static unsigned int features[] = {
>  	VIRTIO_IOMMU_F_DOMAIN_RANGE,
>  	VIRTIO_IOMMU_F_PROBE,
>  	VIRTIO_IOMMU_F_MMIO,
> +	VIRTIO_IOMMU_F_BYPASS_CONFIG,
>  };
>  
>  static struct virtio_device_id id_table[] = {

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
