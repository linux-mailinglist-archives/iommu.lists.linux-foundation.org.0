Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E6B348DF0
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 11:27:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1F5B40193;
	Thu, 25 Mar 2021 10:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAe_Zli0NA3l; Thu, 25 Mar 2021 10:27:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id E479A40146;
	Thu, 25 Mar 2021 10:27:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C20DEC000A;
	Thu, 25 Mar 2021 10:27:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD663C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 10:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC7626075B
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 10:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CvN3AweIOtV for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 10:27:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6D45606FD
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 10:27:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id g25so881008wmh.0
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 03:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u9AkdAVb0gsY6G2Oei9QB4lZ6Usat1kUEujoUhrt1js=;
 b=QSAmfgEVULSIhCaPdxWKJcVrRBjVBDsS0MmFMIPOq9bRxTAPOK04UvAqkTDtsAX5zl
 R3UjLwuRfcbW9sL8Lnxv/AScRo2vVP3gxjtftPodfxo+2+YeaHgnQ3z4djluByoM0eec
 qc73JgmFYVWwwYhqPgPTmV9EyuypESanyM8URvd1xSs2qwrJSJz1FFUOod8S5BH6ox+n
 eRa4xcqneXr4ob4p7geLCd86atWQTyDU7x6Nc0CVtPADzPOiUwMFjeJ+KtMUKwhiImbi
 u1O/kLwY+2mpo4dgm4IN7Whnq6O8CmsBxKKazHidEBCbWK2UVMzSUm0wPTRy0H9KXhlJ
 j8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u9AkdAVb0gsY6G2Oei9QB4lZ6Usat1kUEujoUhrt1js=;
 b=iw5EFfEgnqmb45aylWsHhtbF5MEii2invXAtBCnVG+02jKZJCUTfAmlHUtybbCb7mI
 CxhP8wEGviNG3mqAjYDIxJTt+e5CXXe1+P0zAmOfP9jhVjufVjSP0b8usIAAjjGzn2mM
 VaJUwD8VCE8h6vpVRQS06iMQCdA9Y1frxmXhp+UsO9jSCqW2LVUjFyq9C5eltOW15FDc
 yD4/VITdd19pNdp9urge2GUv6RJlwj/kmv33zlrASbl0HhOjEfWs1qPdJSAlSblSd7uN
 b6OKjmRMowGb5+THYchTumLFTVHIC+kodudy6+XB2DrLyU+2K8du8SZgMp/0ZV9Jj3TI
 LZpw==
X-Gm-Message-State: AOAM530UDk4ss4nAl/KE3avA9eP8AWfVhPQ3ZYBlN9+Q4HGZ8I6Eat9O
 JmBHlYdM1HZrZciQZ0RG51bE5A==
X-Google-Smtp-Source: ABdhPJzcCvskJZ6yQh4gQM1EDi3CeuNOCBqf1v+7r9Xt7it043Y7/pJ2ysEv0jO72DGabGGkwgvQ8Q==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr7173757wmq.67.1616668026900; 
 Thu, 25 Mar 2021 03:27:06 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id p18sm6532434wrs.68.2021.03.25.03.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 03:27:06 -0700 (PDT)
Date: Thu, 25 Mar 2021 11:26:48 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <YFxlaGyJkTM1m9IX@myrica>
References: <1614463286-97618-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1614463286-97618-6-git-send-email-jacob.jun.pan@linux.intel.com>
 <20210318172234.3e8c34f7@jacob-builder> <YFR10eeDVf5ZHV5l@myrica>
 <20210319124645.GP2356281@nvidia.com> <YFSqDNJ5yagk4eO+@myrica>
 <20210319135432.GT2356281@nvidia.com>
 <20210319112221.5123b984@jacob-builder> <YFhiMLR35WWMW/Hu@myrica>
 <20210324100246.4e6b8aa1@jacob-builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324100246.4e6b8aa1@jacob-builder>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 iommu@lists.linux-foundation.org, Li Zefan <lizefan@huawei.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>
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

On Wed, Mar 24, 2021 at 10:02:46AM -0700, Jacob Pan wrote:
> > And a flag IOMMU_SVA_BIND_SUPERVISOR (not that I plan to implement it in
> > the SMMU, but I think we need to clean the current usage)
> > 
> You mean move #define SVM_FLAG_SUPERVISOR_MODE out of Intel code to be a
> generic flag in iommu-sva-lib.h called IOMMU_SVA_BIND_SUPERVISOR?

Yes, though it would need to be in iommu.h since it's used by device
drivers

> > Also wondering about device driver allocating auxiliary domains for their
> > private use, to do iommu_map/unmap on private PASIDs (a clean replacement
> > to super SVA, for example). Would that go through the same path as
> > /dev/ioasid and use the cgroup of current task?
> >
> For the in-kernel private use, I don't think we should restrict based on
> cgroup, since there is no affinity to user processes. I also think the
> PASID allocation should just use kernel API instead of /dev/ioasid. Why
> would user space need to know the actual PASID # for device private domains?
> Maybe I missed your idea?

No that's my bad, I didn't get the role of /dev/ioasid. Let me give the
series a proper read.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
