Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FD21DEDFB
	for <lists.iommu@lfdr.de>; Fri, 22 May 2020 19:15:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4679D866DD;
	Fri, 22 May 2020 17:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWjLNvUv2Oz8; Fri, 22 May 2020 17:15:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AC9C98689B;
	Fri, 22 May 2020 17:15:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FBC7C0890;
	Fri, 22 May 2020 17:15:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 258AEC0176
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 17:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0DDC887A60
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 17:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsPv-8dtmGWn for <iommu@lists.linux-foundation.org>;
 Fri, 22 May 2020 17:15:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0A6E187A5D
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 17:15:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l11so10924308wru.0
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 10:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=09cuiPopIOJ5aAQOSJRwjVEJJoZ5ZgmUzhsRLgEZpY0=;
 b=r/uep0uuJQLYx20aHcrEbEpO3MMibL4LPe/jFDu4IN2wSG9yqX5PXP245RsG//+TO/
 Cocvp89LCLIPNNYlc6OykX8uBrz6LwI+ReTQvzxRSOMOey16m0EEisxn2tx5VunYYTPP
 1jbBQZtV83OTjzCQnsh+N53ProKGcWMS8TGEyyuf7fSKcAfptwIo5LRCJv+avtpmP8L4
 hw0ACBaOW0MFC/hnBrM5W8WeEfd600mle588Ys+xGLVDUUVJWDPhAxhlT3jyUMO8ckJo
 0HWO5mb4UdgvRrUcQTNZ8YcozyhK/90aBnlFS7/6rR61MKaYkOxfcqk8kWjHK77a+8sz
 MR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=09cuiPopIOJ5aAQOSJRwjVEJJoZ5ZgmUzhsRLgEZpY0=;
 b=IYiJtPqPGds6MfK0Gi2NvtofqOP/v1Y8nnGITdZ02CmUWDkQD6g0d9HjAM7eUKSvBg
 tox3FDK6i7I8MC2CtmeIXUXnPi99MdUfpzOdb2BKXbZ3uIb9hlI9Gi/nNuWDwecBIovH
 hg7xePrt4yM91545pp84tT5/ImRi8K0xT6TUAUJKspIVRXLpFNmN+COU9EwvqamPoGn4
 aH7AeIFrzDUxte7yl8r6XDKpR/iXkA4D1p6kJJq8CUkweBbidx/zVLeeuFDIGvm9O6no
 zFuzRyfTaLI7oJBXphhQUuMYTfkoqyTkJNxWujIg8DsP/La6sC3UvEZr2f+xagPXUqkQ
 4N5w==
X-Gm-Message-State: AOAM531iKwxp8CBEbeuQVJSREaLog/O+9YkIya/EgaxXNjSKm0xh/9AC
 q/ncY+3Q1lP8aSV6UpbObXw2xA==
X-Google-Smtp-Source: ABdhPJyxZ7kAMuA18QTw/krT1LaT+RyS8m/xIWMdni16UN7OYLdnQFqzGTPLW06K+87Eh9MIsX4pmw==
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr4331584wrs.18.1590167705375;
 Fri, 22 May 2020 10:15:05 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id h74sm10394613wrh.76.2020.05.22.10.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:15:04 -0700 (PDT)
Date: Fri, 22 May 2020 19:14:52 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Xiang Zheng <zhengxiang9@huawei.com>
Subject: Re: [RFC] Use SMMU HTTU for DMA dirty page tracking
Message-ID: <20200522171452.GC3453945@myrica>
References: <b926ec0b-fe87-0792-c41d-acad56c656a4@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b926ec0b-fe87-0792-c41d-acad56c656a4@huawei.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, maz@kernel.org,
 iommu@lists.linux-foundation.org, James Morse <james.morse@arm.com>,
 julien.thierry.kdev@gmail.com, prime.zeng@hisilicon.com,
 Wang Haibin <wanghaibin.wang@huawei.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
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

Hi,

On Tue, May 19, 2020 at 05:42:55PM +0800, Xiang Zheng wrote:
> Hi all,
> 
> Is there any plan for enabling SMMU HTTU?

Not outside of SVA, as far as I know.

> I have seen the patch locates in the SVA series patch, which adds
> support for HTTU:
>     https://www.spinics.net/lists/arm-kernel/msg798694.html
> 
> HTTU reduces the number of access faults on SMMU fault queue
> (permission faults also benifit from it).
> 
> Besides reducing the faults, HTTU also helps to track dirty pages for
> device DMA. Is it feasible to utilize HTTU to get dirty pages on device
> DMA during VFIO live migration?

As you know there is a VFIO interface for this under discussion:
https://lore.kernel.org/kvm/1589781397-28368-1-git-send-email-kwankhede@nvidia.com/
It doesn't implement an internal API to communicate with the IOMMU driver
about dirty pages.

> If SMMU can track dirty pages, devices are not required to implement
> additional dirty pages tracking to support VFIO live migration.

It seems feasible, though tracking it in the device might be more
efficient. I might have misunderstood but I think for live migration of
the Intel NIC they trap guest accesses to the device and introspect its
state to figure out which pages it is accessing.

With HTTU I suppose (without much knowledge about live migration) that
you'd need several new interfaces to the IOMMU drivers:

* A way for VFIO to query HTTU support in the SMMU. There are some
  discussions about communicating more IOMMU capabilities through VFIO but
  no implementation yet. When HTTU isn't supported the DIRTY_PAGES bitmap
  would report all pages as they do now.

* VFIO_IOMMU_DIRTY_PAGES_FLAG_START/STOP would clear the dirty bit
  for all VFIO mappings (which is going to take some time). There is a
  walker in io-pgtable for iova_to_phys() which could be extended. I
  suppose it's also possible to atomically switch the HA and HD bits in
  context descriptors.

* VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP would query the dirty bit for all
  VFIO mappings.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
