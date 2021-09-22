Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD3414C6D
	for <lists.iommu@lfdr.de>; Wed, 22 Sep 2021 16:50:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CF70608D9;
	Wed, 22 Sep 2021 14:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2uXm5GdC-OOg; Wed, 22 Sep 2021 14:50:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2E1266081A;
	Wed, 22 Sep 2021 14:50:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ACF9C000D;
	Wed, 22 Sep 2021 14:50:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C675C000D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 14:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B8E840715
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 14:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGJ4L8RJQMrv for <iommu@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 14:50:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7D6E406CA
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 14:50:03 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id eg28so11090218edb.1
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TDrEpOj5z77SP2jdIw8cDIbvUad+t7NAXsCzDrXUEuo=;
 b=Ew0C8IKjSewOIfs1ywupioINHT/n6wPGtq2fNW0XmEFgFckhAnNx18kVuxyeob5MSb
 cG6vPdVQgy2y/2wCxrRgFAVzYfZgiGTRAFY3tcx6CIPvOZav9+pzr2A0g2V9jt2k0cSq
 9HHpBz6+Sfe0bQsurN4lUeiDAbqyklaJsw449YG114/qp9WKYRH5zxvga2tXVvb3mBga
 Cp+1KKZGvZQEC1wAnFvKoWVHGqnD2mGmydz+QUuPFHn2wQYUaZSi2A1opiUYI1VjnPGd
 EZHj0i05y8g9gyXadz3X1/RTTTyBrx7N4tTAhBK9sP7DGVVpXSKcFO8kZKq7qkBWjYyo
 S4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TDrEpOj5z77SP2jdIw8cDIbvUad+t7NAXsCzDrXUEuo=;
 b=TJ8R1/xQgAKzEjkle8YFbBEfb2Rsf5z//qy5IhaACb0On529hJ0UeH8ieUAb6B2ArJ
 +haE6LnK0pOsDKVRtpbl//42jDT2WrI2dz3P8/jXSpjNY9/p025CWhCvJq1js8iA6DbG
 s0ESUwwmDx6XiwOEwsMtwfQnkxYCyr2tERnNkFdo+YP+TxDGtUukvMsKtPuY4jkd2ECx
 wIOkXhnHYGF3ZNX86xq6HAT0hX9camV+7zE+Z2QiPCwNIxujr1oB9RjkNSizTtPa5yqT
 bKMY4yGsQFME5hPpqgl+yjoCslnLgwF62TM6kXX5qvULbd6Fnqi37tMqe8R0fn8pCxYt
 PScg==
X-Gm-Message-State: AOAM531++IaRpR2H1gq2X6EMJjYS8A9X+6ZRLWM0FPGCh6q7kZ9wqRvh
 WxStiSoSx6dwUD4BtGgq2tM6YwcY74NOgw==
X-Google-Smtp-Source: ABdhPJxMpjDOCwgilrcdezM3QInKUMDiNn1/siG8KtEO0JxOOJ9kWoOrqZ1UQupWEHroXThfagdnpQ==
X-Received: by 2002:a5d:66c6:: with SMTP id k6mr11823034wrw.382.1632322167122; 
 Wed, 22 Sep 2021 07:49:27 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id z17sm2151265wml.24.2021.09.22.07.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:49:26 -0700 (PDT)
Date: Wed, 22 Sep 2021 15:49:05 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [RFC 17/20] iommu/iommufd: Report iova range to userspace
Message-ID: <YUtCYZI3oQcwKrUh@myrica>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-18-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919063848.1476776-18-yi.l.liu@intel.com>
Cc: kvm@vger.kernel.org, jasowang@redhat.com, kwankhede@nvidia.com, hch@lst.de,
 dave.jiang@intel.com, ashok.raj@intel.com, corbet@lwn.net, jgg@nvidia.com,
 kevin.tian@intel.com, parav@mellanox.com, alex.williamson@redhat.com,
 lkml@metux.net, david@gibson.dropbear.id.au, dwmw2@infradead.org,
 jun.j.tian@intel.com, linux-kernel@vger.kernel.org, lushenming@huawei.com,
 iommu@lists.linux-foundation.org, pbonzini@redhat.com, robin.murphy@arm.com
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

On Sun, Sep 19, 2021 at 02:38:45PM +0800, Liu Yi L wrote:
> [HACK. will fix in v2]
> 
> IOVA range is critical info for userspace to manage DMA for an I/O address
> space. This patch reports the valid iova range info of a given device.
> 
> Due to aforementioned hack, this info comes from the hacked vfio type1
> driver. To follow the same format in vfio, we also introduce a cap chain
> format in IOMMU_DEVICE_GET_INFO to carry the iova range info.
[...]
> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> index 49731be71213..f408ad3c8ade 100644
> --- a/include/uapi/linux/iommu.h
> +++ b/include/uapi/linux/iommu.h
> @@ -68,6 +68,7 @@
>   *		   +---------------+------------+
>   *		   ...
>   * @addr_width:    the address width of supported I/O address spaces.
> + * @cap_offset:	   Offset within info struct of first cap
>   *
>   * Availability: after device is bound to iommufd
>   */
> @@ -77,9 +78,11 @@ struct iommu_device_info {
>  #define IOMMU_DEVICE_INFO_ENFORCE_SNOOP	(1 << 0) /* IOMMU enforced snoop */
>  #define IOMMU_DEVICE_INFO_PGSIZES	(1 << 1) /* supported page sizes */
>  #define IOMMU_DEVICE_INFO_ADDR_WIDTH	(1 << 2) /* addr_wdith field valid */
> +#define IOMMU_DEVICE_INFO_CAPS		(1 << 3) /* info supports cap chain */
>  	__u64	dev_cookie;
>  	__u64   pgsize_bitmap;
>  	__u32	addr_width;
> +	__u32   cap_offset;

We can also add vendor-specific page table and PASID table properties as
capabilities, otherwise we'll need giant unions in the iommu_device_info
struct. That made me wonder whether pgsize and addr_width should also be
separate capabilities for consistency, but this way might be good enough.
There won't be many more generic capabilities. I have "output address
width" and "PASID width", the rest is specific to Arm and SMMU table
formats.

Thanks,
Jean

>  };
>  
>  #define IOMMU_DEVICE_GET_INFO	_IO(IOMMU_TYPE, IOMMU_BASE + 1)
> -- 
> 2.25.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
