Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A13E4136D3
	for <lists.iommu@lfdr.de>; Tue, 21 Sep 2021 17:59:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07360402F3;
	Tue, 21 Sep 2021 15:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEX34DinGz1G; Tue, 21 Sep 2021 15:59:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B8CAC40660;
	Tue, 21 Sep 2021 15:59:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3C5CC0025;
	Tue, 21 Sep 2021 15:59:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B25DCC000D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 15:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A15B6402FF
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 15:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yx7IpFFUzh1x for <iommu@lists.linux-foundation.org>;
 Tue, 21 Sep 2021 15:59:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA424402F3
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 15:59:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q26so40640480wrc.7
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AtZyyTP986q5izPT5lFbv6cJ5CVeOkj7bVUgoAF+aPE=;
 b=qn8z1Wbkql8CqtKixkOZJfHbzjeuBbinRO0kMwKxCb0qOIrbleyJ5e2P2YBme9hhQd
 npB+D2tprMu7tQ9xPboAPoUxLWvzYj0qtGUdZWjjnX/QACr4MJjk9P6kaSN/NVT4vhSo
 C9ODmI/mHhyqcDhULh3v0wjFyt8Uu/Elftxsz4cTyqK6mkROt3VFsJtokj4kXciRUZfX
 OsxZgAgRk2Z8USr6T+8L0LP7KNak3SelmLNRb6o1DuePBxyc0FGr/ZG6/wccXWQhCKg4
 fu5VLgQA3b/YaW/POQ2oM8m7kG1gdwq9KHKIwzfrYAYUI2CMm+Wbw7X6yS6nTTRLRwEq
 3kZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AtZyyTP986q5izPT5lFbv6cJ5CVeOkj7bVUgoAF+aPE=;
 b=iPcGZNuwNOX/AbJ2OsY3EEfwb8GLJX49duQ8DJPII0/yLWkXzNmL73ho2ME0LT/36N
 2iW/cEcs3aFQaK1CWLU3jrlF3Kq5d9IPTWiodJKPmggN8O18H/TJ/qzN4CejmxmaoTXo
 W2NtHTs93qRAtrD+W8TnCCRZxxr3v1z4exmBd97AB/VCcO2lso1uUs7+la6NOvpoB/WH
 Q6zSJdYXGAaJemBTmOJNC1wbD1NUWY625e7zR9k3JygEw2gqILkvi9mW5HwXj+oTHQrs
 cUSXfSK9Sg88VKXcWQmQStzYMXX/HdQ8wui3JgOQyOv+0cRxgFWYKZf6fzQk62uK60F3
 VN3w==
X-Gm-Message-State: AOAM533mS+x60byhbw8VdI0y6I+EVn54bi7jlsY+o5JbbPkYUuIb6CZ8
 bNHV24h1O+kQf8Ai/imoEU/ZMQ==
X-Google-Smtp-Source: ABdhPJwaROKNZrdKnelWS30U+Qu/Ae+90Y3oEspXKLXzr2302zCcSxHLGjrCndLcOXgApQye9wguvg==
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr36130015wru.285.1632239985681; 
 Tue, 21 Sep 2021 08:59:45 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id o1sm2799031wmq.26.2021.09.21.08.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 08:59:45 -0700 (PDT)
Date: Tue, 21 Sep 2021 16:59:23 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Vivek Gautam <vivek.gautam@arm.com>
Subject: Re: [PATCH RFC v1 02/11] iommu/virtio: Maintain a list of endpoints
 served by viommu_dev
Message-ID: <YUoBW13+CvIljUgc@myrica>
References: <20210423095147.27922-1-vivek.gautam@arm.com>
 <20210423095147.27922-3-vivek.gautam@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423095147.27922-3-vivek.gautam@arm.com>
X-TUID: +1WeLErnK1xS
Cc: kevin.tian@intel.com, mst@redhat.com, will.deacon@arm.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, Apr 23, 2021 at 03:21:38PM +0530, Vivek Gautam wrote:
> Keeping a record of list of endpoints that are served by the virtio-iommu
> device would help in redirecting the requests of page faults to the
> correct endpoint device to handle such requests.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
> ---
>  drivers/iommu/virtio-iommu.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 50039070e2aa..c970f386f031 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -48,6 +48,7 @@ struct viommu_dev {
>  	spinlock_t			request_lock;
>  	struct list_head		requests;
>  	void				*evts;
> +	struct list_head		endpoints;

As we're going to search by ID, an xarray or rb_tree would be more
appropriate than a list

>  
>  	/* Device configuration */
>  	struct iommu_domain_geometry	geometry;
> @@ -115,6 +116,12 @@ struct viommu_endpoint {
>  	void				*pgtf;
>  };
>  
> +struct viommu_ep_entry {
> +	u32				eid;
> +	struct viommu_endpoint		*vdev;
> +	struct list_head		list;
> +};

No need for a separate struct, I think you can just add the list head and
id into viommu_endpoint.

> +
>  struct viommu_request {
>  	struct list_head		list;
>  	void				*writeback;
> @@ -573,6 +580,7 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
>  	size_t probe_len;
>  	struct virtio_iommu_req_probe *probe;
>  	struct virtio_iommu_probe_property *prop;
> +	struct viommu_ep_entry *ep;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
>  
> @@ -640,6 +648,18 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
>  		prop = (void *)probe->properties + cur;
>  		type = le16_to_cpu(prop->type) & VIRTIO_IOMMU_PROBE_T_MASK;
>  	}
> +	if (ret)
> +		goto out_free;
> +
> +	ep = kzalloc(sizeof(*ep), GFP_KERNEL);
> +	if (!ep) {
> +		ret = -ENOMEM;
> +		goto out_free;
> +	}
> +	ep->eid = probe->endpoint;
> +	ep->vdev = vdev;
> +
> +	list_add(&ep->list, &viommu->endpoints);

This should be in viommu_probe_device() (viommu_probe_endpoint() is only
called if F_PROBE is negotiated). I think we need a lock for this
list/xarray

Thanks,
Jean

>  
>  out_free:
>  	kfree(probe);
> @@ -1649,6 +1669,7 @@ static int viommu_probe(struct virtio_device *vdev)
>  	viommu->dev = dev;
>  	viommu->vdev = vdev;
>  	INIT_LIST_HEAD(&viommu->requests);
> +	INIT_LIST_HEAD(&viommu->endpoints);
>  
>  	ret = viommu_init_vqs(viommu);
>  	if (ret)
> -- 
> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
