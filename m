Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E575E401613
	for <lists.iommu@lfdr.de>; Mon,  6 Sep 2021 07:56:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA35403EC;
	Mon,  6 Sep 2021 05:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvl56Wa8na5T; Mon,  6 Sep 2021 05:56:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C78A1403EF;
	Mon,  6 Sep 2021 05:56:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACF89C000E;
	Mon,  6 Sep 2021 05:56:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E87BBC000E
 for <iommu@lists.linux-foundation.org>; Mon,  6 Sep 2021 05:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA961403EF
 for <iommu@lists.linux-foundation.org>; Mon,  6 Sep 2021 05:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkq5AqoIODQF for <iommu@lists.linux-foundation.org>;
 Mon,  6 Sep 2021 05:56:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20404403EC
 for <iommu@lists.linux-foundation.org>; Mon,  6 Sep 2021 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630907764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vovMbtPf5r3ofbG1k9TCSMxb7U8AijKtdOS/02BCPEA=;
 b=CVESPRfNdTF+vdulmTYD6011okiVK50tVhKpHgiwg6X9DOUUcd8qipPyTBLeQSKRVS8t3n
 bRQMqGEEZcV7KDQQYhu59wlIvAXaZmCVNSm0K9rugA+OIBD6cYXJtxruo4OAGiCnHR+bXo
 Wr4tcQFBY11srz8uGWBGH0M2WkWBWDE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-cVpC_1iSMmuXoRT_jlEIzA-1; Mon, 06 Sep 2021 01:56:03 -0400
X-MC-Unique: cVpC_1iSMmuXoRT_jlEIzA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f19-20020a1c1f13000000b002e6bd83c344so2809377wmf.3
 for <iommu@lists.linux-foundation.org>; Sun, 05 Sep 2021 22:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vovMbtPf5r3ofbG1k9TCSMxb7U8AijKtdOS/02BCPEA=;
 b=K1ah39EeWIX65kN1FyMNBBh+X/0AVFewszoT87dV58TFOkmbcZ1+UlAmwPxQ8l4GO0
 euQMNP6n5+1o+gsA1an44X/Eu6ysc4DCWeKDRSiVoXVa3bojNJQvmFCoBnL6qKYCXjr3
 BvdV1q+U6lg29vvDx/Z2k5sBrXeclKKv7LxtRKwXmIPrR07lzCqCYjwQg10d79KzqGV0
 4ZTAc5oAyl9EgpX6BfiLxnSL1isSP74eu2tIOPc0dlXeICK3wSSp4aLMfL+uwNysnDyZ
 Q6pmn8cMM2VZ4IQUU9bqFKqrgsy9Iuvu1as6ubReO/jekHdhI11RaV29KkPptyV5ecIs
 eQew==
X-Gm-Message-State: AOAM530xth8emYfqYDv2++iO+NKdZ/5myL8RvqSPkA2JYjBI9SrwY3Oc
 Qj9WGJfbNx21kSc40gkYSuVbb+LnJwv0Nq1Uk1xJwI/8vmH42Y07+0vCgmhD4A1q0yn5IXJBKhP
 4/O9LiCJTacvobnx5NnD5y2uOyN/pGA==
X-Received: by 2002:a1c:a50c:: with SMTP id o12mr9495404wme.4.1630907762444;
 Sun, 05 Sep 2021 22:56:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSohV4waNTUQh5Sb39O42c9OGim/c0J+8EbtpG04qEdzlJ16UAGsVC7V6aTmAbRvcBXz/LFQ==
X-Received: by 2002:a1c:a50c:: with SMTP id o12mr9495363wme.4.1630907762186;
 Sun, 05 Sep 2021 22:56:02 -0700 (PDT)
Received: from redhat.com ([2.55.131.183])
 by smtp.gmail.com with ESMTPSA id a133sm6174326wme.5.2021.09.05.22.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 22:56:01 -0700 (PDT)
Date: Mon, 6 Sep 2021 01:55:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v13 05/13] vdpa: Add reset callback in vdpa_config_ops
Message-ID: <20210906015524-mutt-send-email-mst@kernel.org>
References: <20210831103634.33-1-xieyongji@bytedance.com>
 <20210831103634.33-6-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210831103634.33-6-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, christian.brauner@canonical.com,
 will@kernel.org, corbet@lwn.net, willy@infradead.org, hch@infradead.org,
 dan.carpenter@oracle.com, sgarzare@redhat.com, xiaodong.liu@intel.com,
 linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, stefanha@redhat.com,
 songmuchun@bytedance.com, axboe@kernel.dk, zhe.he@windriver.com,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, bcrl@kvack.org,
 netdev@vger.kernel.org, joe@perches.com, robin.murphy@arm.com,
 mika.penttila@nextfour.com
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

On Tue, Aug 31, 2021 at 06:36:26PM +0800, Xie Yongji wrote:
> This adds a new callback to support device specific reset
> behavior. The vdpa bus driver will call the reset function
> instead of setting status to zero during resetting.
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>


This does gloss over a significant change though:


> ---
> @@ -348,12 +352,12 @@ static inline struct device *vdpa_get_dma_dev(struct vdpa_device *vdev)
>  	return vdev->dma_dev;
>  }
>  
> -static inline void vdpa_reset(struct vdpa_device *vdev)
> +static inline int vdpa_reset(struct vdpa_device *vdev)
>  {
>  	const struct vdpa_config_ops *ops = vdev->config;
>  
>  	vdev->features_valid = false;
> -	ops->set_status(vdev, 0);
> +	return ops->reset(vdev);
>  }
>  
>  static inline int vdpa_set_features(struct vdpa_device *vdev, u64 features)


Unfortunately this breaks virtio_vdpa:


static void virtio_vdpa_reset(struct virtio_device *vdev)
{
        struct vdpa_device *vdpa = vd_get_vdpa(vdev);

        vdpa_reset(vdpa);
}


and there's no easy way to fix this, kernel can't recover
from a reset failure e.g. during driver unbind.

Find a way to disable virtio_vdpa for now?


> -- 
> 2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
