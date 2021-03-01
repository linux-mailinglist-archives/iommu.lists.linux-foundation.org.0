Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E8626327823
	for <lists.iommu@lfdr.de>; Mon,  1 Mar 2021 08:17:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CF2E82EF0;
	Mon,  1 Mar 2021 07:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkvrgZcZ702b; Mon,  1 Mar 2021 07:17:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F2182F06;
	Mon,  1 Mar 2021 07:17:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D9BAC0001;
	Mon,  1 Mar 2021 07:17:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18419C0001
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07C7F605E5
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcL0bli3Fdhh for <iommu@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 07:17:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71336605E4
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:17:49 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 i4-20020a17090a7184b02900bfb60fbc6bso1966362pjk.0
 for <iommu@lists.linux-foundation.org>; Sun, 28 Feb 2021 23:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gONCc0ixoRKjPUJ0zP8hmFkWFvyDxygh0qJOWZmcFdU=;
 b=N/8qgwXtE/G/fdawu/Fmb4mJBx6ezmXyU21jAUzWM6K/79Lrri652nxJ472KigfrE/
 VURa7PizmidkddaH4izsdfcMqcr5v6p2X3pFUDQegRATUcnZO/lMjJzs6cjCBlSFo+jt
 r7ZsPHlSVhYG8ejRDtmG+UT4Epzy/QzbTxFLB9U0U8TiiI5nQPHxz4PLaY9WXATtFRIQ
 ftr1hyefCK1dsRM+ko6czzc1Kx3N8isfrl2h+t5brWYvS6lqplvSn89WHL2bfFvxfvN6
 Gu3mzywhSyX2AGEtW/n+Egp/qJzvKrlwXmSwPuBNPI7GcyxW6lVq4yIyJ/HT9cCULa/n
 y5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gONCc0ixoRKjPUJ0zP8hmFkWFvyDxygh0qJOWZmcFdU=;
 b=db58yBORS6m0xcg2Tz+gkOJcRYiOZourt0pOueM5q0qUIFsKwmLQ6X/lhN92NI6qW4
 Ouw57I8kTKxJ3peKtlykKEyn2s9uoktaFHGkm0YQO9USf1hgkPAYPV9YGwZCV3d2lHK4
 v6hOIFM5PCMSz3wUFmjVwZuzAFOZzvsLr62nDQqY2QNfPI50FXL8RJVkNsNyR42OQahi
 KPSlft/EF7jUl0/P7kJLyXgT4feAV79NyDS0M9Ayktk+Sjq9zOzWozKd8jsIgElRsXbu
 RH8ij6vM31JYUxwtRRRa07arGS38qiSZ9fu71BQdBKja7XBTXBYUV/vKmB1/H0S8slH5
 4Jug==
X-Gm-Message-State: AOAM533z8KY2i2MI1q/Nlx9RmIqFz+/FSWhCOxnyJq8OmPYQ70A0hMaY
 EWemBig8kzxpM1borIjexNI=
X-Google-Smtp-Source: ABdhPJwsIHRc09CGc3LHIDlq4x0PhiyRF7geKl4Fls4ZybTN+ojHynqyozoqUa+9wweO0267NYAUoQ==
X-Received: by 2002:a17:902:8d95:b029:e2:c956:f085 with SMTP id
 v21-20020a1709028d95b02900e2c956f085mr14054151plo.35.1614583068826; 
 Sun, 28 Feb 2021 23:17:48 -0800 (PST)
Received: from google.com ([2409:10:2e40:5100:b0d4:9de6:fcfc:43a8])
 by smtp.gmail.com with ESMTPSA id u129sm16185037pfu.219.2021.02.28.23.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 23:17:48 -0800 (PST)
Date: Mon, 1 Mar 2021 16:17:42 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/7] dma-iommu: implement ->alloc_noncontiguous
Message-ID: <YDyVFi26RPz5RrJB@google.com>
References: <20210202095110.1215346-1-hch@lst.de>
 <20210202095110.1215346-7-hch@lst.de>
 <CAAFQd5BXAWeB2h4RvqsF1q8ip-Rhew80c7y1_og22-x3rS8KOQ@mail.gmail.com>
 <20210216084947.GA23897@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216084947.GA23897@lst.de>
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On (21/02/16 09:49), Christoph Hellwig wrote:
> > When working on the videobuf2 integration with Sergey I noticed that
> > we always pass 0 as DMA attrs here, which removes the ability for
> > drivers to use DMA_ATTR_ALLOC_SINGLE_PAGES.
> > 
> > It's quite important from a system stability point of view, because by
> > default the iommu_dma allocator would prefer big order allocations for
> > TLB locality reasons. For many devices, though, it doesn't really
> > affect the performance, because of random access patterns, so single
> > pages are good enough and reduce the risk of allocation failures or
> > latency due to fragmentation.
> > 
> > Do you think we could add the attrs parameter to the
> > dma_alloc_noncontiguous() API?
> 
> Yes, we could probably do that.

I can cook a patch, unless somebody is already looking into it.

	-ss
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
