Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C2728A7C9
	for <lists.iommu@lfdr.de>; Sun, 11 Oct 2020 16:33:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6375E86911;
	Sun, 11 Oct 2020 14:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BWoZkirzolck; Sun, 11 Oct 2020 14:33:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FCCC868F3;
	Sun, 11 Oct 2020 14:33:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47913C0051;
	Sun, 11 Oct 2020 14:33:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C67CCC0051
 for <iommu@lists.linux-foundation.org>; Sun, 11 Oct 2020 14:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 985E72045F
 for <iommu@lists.linux-foundation.org>; Sun, 11 Oct 2020 14:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id niZZsvfFXPXO for <iommu@lists.linux-foundation.org>;
 Sun, 11 Oct 2020 14:33:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by silver.osuosl.org (Postfix) with ESMTPS id D1AF6203A4
 for <iommu@lists.linux-foundation.org>; Sun, 11 Oct 2020 14:33:29 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id w7so3486516oow.7
 for <iommu@lists.linux-foundation.org>; Sun, 11 Oct 2020 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/DdKNaZCvAXe1mNXdt0/1kR2PVkkrse0hpve2MhxkBE=;
 b=ebEzarZJB8d27LWIHE8Q1yP2hEHdAZD5eb/un8vIUzebipa1GcUkA1bhvhILdTcCfz
 djTVdZZ06H0Y6jZhxfBuk1Wh/tVHdgQ0ENI3npxg8Ho5H/WpqtzDZXXhSQYh5zTalwvV
 Tjq+oHHTbhEJ8Mbo3ka1lj+h+J7ZcvVj7P2Rb629iKp/H+o/bXTL82VKMjdwTUElzqE/
 V7O/dNfRJG2EKAGcadQ8a0GmFQYhOZYMyf8DizsLGtTVm+7smiTcLuQ0wWTHzOZzqOEo
 wYXHr3q7XdXXTHV4HLJJbzIlGgS45nn8ti5F4+73KVLq20eWVhVOOG2XQKiGa2CM3luu
 1qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/DdKNaZCvAXe1mNXdt0/1kR2PVkkrse0hpve2MhxkBE=;
 b=mWFOslxjPWHyXy4ipHo50CjvIDKHMYMDvlbwKUUKkL2GskDmRIB2o8lq3976jj85+J
 emsICJt1pedKkkNTgeK55rWlgCf/tDs8mwkZbwjuiOOvgCdrwyc5a76yUOhV55WfHyDN
 8hIhCAlUoBhPejYof+NLUa7+4ESxrT3NEfWCWyUMl8wUjULKrxl5mJWdXocK0lMEXX1u
 /3oLb27ksWT/4ATOhjyVZnp0q4L+OiuWlIoudiU42wkXDRYh2TCIFBZsNZJxBo7yg0Kw
 o1FTVvDXY3DzQD1Luj/m9H6xgtYM+eZKw5hA6losByIjUFMx2UpCIxqgaFMscCM3nD31
 24Gw==
X-Gm-Message-State: AOAM530FUIXNPue91wSm3R5YcKkY35Fm9mWCVjKQL4TaLr+bwLODxD6c
 ciRNeh62NYSQ+SXjKcF/2LQ=
X-Google-Smtp-Source: ABdhPJxVMW33cBvb5/pwyVhvf9ggu1NFIoXlPLh0PJLClQVmOH6o5GIQPIkFizFqz/dPccsXGzTgKw==
X-Received: by 2002:a4a:7055:: with SMTP id b21mr15610080oof.26.1602426808981; 
 Sun, 11 Oct 2020 07:33:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id y51sm219117otb.47.2020.10.11.07.33.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 11 Oct 2020 07:33:28 -0700 (PDT)
Date: Sun, 11 Oct 2020 07:33:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] dma-mapping: split <linux/dma-mapping.h>
Message-ID: <20201011143327.GA251807@roeck-us.net>
References: <20200930085548.920261-1-hch@lst.de>
 <20200930085548.920261-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930085548.920261-2-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-arch@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
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

On Wed, Sep 30, 2020 at 10:55:40AM +0200, Christoph Hellwig wrote:
> Split out all the bits that are purely for dma_map_ops implementations
> and related code into a new <linux/dma-map-ops.h> header so that they
> don't get pulled into all the drivers.  That also means the architecture
> specific <asm/dma-mapping.h> is not pulled in by <linux/dma-mapping.h>
> any more, which leads to a missing includes that were pulled in by the
> x86 or arm versions in a few not overly portable drivers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This patch results in the following build error.

Building arm:ixp4xx_defconfig ... failed
--------------
Error log:
arch/arm/mach-ixp4xx/common.c: In function 'ixp4xx_platform_notify_remove':
arch/arm/mach-ixp4xx/common.c:291:3: error: implicit declaration of function 'dmabounce_unregister_dev' [-Werror=implicit-function-declaration]
  291 |   dmabounce_unregister_dev(dev);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~
arch/arm/mach-ixp4xx/common.c: In function 'ixp4xx_platform_notify':
arch/arm/mach-ixp4xx/common.c:307:3: error: implicit declaration of function 'dmabounce_register_dev' [-Werror=implicit-function-declaration]
  307 |   dmabounce_register_dev(dev, 2048, 4096, ixp4xx_needs_bounce);

Bisect log attached.

Guenter

---
# bad: [d67bc7812221606e1886620a357b13f906814af7] Add linux-next specific files for 20201009
# good: [549738f15da0e5a00275977623be199fbbf7df50] Linux 5.9-rc8
git bisect start 'HEAD' 'v5.9-rc8'
# bad: [b71be15b496cc71a3434a198fc1a1b9e08af6c57] Merge remote-tracking branch 'bpf-next/master' into master
git bisect bad b71be15b496cc71a3434a198fc1a1b9e08af6c57
# bad: [6be11f939f380ef14bc94242cb0262197ce2a054] Merge remote-tracking branch 'i2c/i2c/for-next' into master
git bisect bad 6be11f939f380ef14bc94242cb0262197ce2a054
# bad: [c03a115d8ad8a87b6d275c3c91c13bc111217bf6] Merge remote-tracking branch 'samsung-krzk/for-next' into master
git bisect bad c03a115d8ad8a87b6d275c3c91c13bc111217bf6
# good: [4f7233567480421eab9c622f395854bfd925f9f2] Merge branch 'arm/dt' into for-next
git bisect good 4f7233567480421eab9c622f395854bfd925f9f2
# bad: [0fa3d3941f0f9fc9b39621af3309b5fdf0c1a6cb] Merge remote-tracking branch 'arm/for-next' into master
git bisect bad 0fa3d3941f0f9fc9b39621af3309b5fdf0c1a6cb
# good: [1357d119df6c359a2903a46522c2511d990db9bb] Merge remote-tracking branch 'sound-current/for-linus' into master
git bisect good 1357d119df6c359a2903a46522c2511d990db9bb
# good: [bd02811392faa248d95f8559498c03933eb7d78b] Merge remote-tracking branch 'kspp-gustavo/for-next/kspp' into master
git bisect good bd02811392faa248d95f8559498c03933eb7d78b
# bad: [0b1abd1fb7efafc25231c54a67c6fbb3d3127efd] dma-mapping: merge <linux/dma-contiguous.h> into <linux/dma-map-ops.h>
git bisect bad 0b1abd1fb7efafc25231c54a67c6fbb3d3127efd
# good: [b9bb694b9f62f4b31652223ed3ca38cf98bbb370] iommu/io-pgtable-arm: Clean up faulty sanity check
git bisect good b9bb694b9f62f4b31652223ed3ca38cf98bbb370
# good: [ed4bc1890b4984d0af447ad3cc1f93541623f8f3] hal2: convert to dma_alloc_noncoherent
git bisect good ed4bc1890b4984d0af447ad3cc1f93541623f8f3
# good: [e8d39a903cc680c8c1ab5e528428f182f42b8a35] dma-iommu: implement ->alloc_noncoherent
git bisect good e8d39a903cc680c8c1ab5e528428f182f42b8a35
# bad: [0a0f0d8be76dcd4390ff538e7060fda34db79717] dma-mapping: split <linux/dma-mapping.h>
git bisect bad 0a0f0d8be76dcd4390ff538e7060fda34db79717
# good: [0de327969b61a245e3a47b60009eae73fe513cef] cma: decrease CMA_ALIGNMENT lower limit to 2
git bisect good 0de327969b61a245e3a47b60009eae73fe513cef
# first bad commit: [0a0f0d8be76dcd4390ff538e7060fda34db79717] dma-mapping: split <linux/dma-mapping.h>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
