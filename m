Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E8F3DDBDF
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 17:06:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8543A83A8D;
	Mon,  2 Aug 2021 15:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mg0YAA16NrWN; Mon,  2 Aug 2021 15:06:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9515283A91;
	Mon,  2 Aug 2021 15:06:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFF6FC0025;
	Mon,  2 Aug 2021 15:06:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2B8EC000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 15:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3165401C5
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 15:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXjS47sXIvwI for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 15:06:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECF1140015
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 15:06:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 716CA60FF2;
 Mon,  2 Aug 2021 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627916810;
 bh=NUdIGVwiZymoyNB/NN4kI7nxgXjg9XtLvBPXAOcs2bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RR+g/cJtTrD9M2DX63ufO+0V+JDARSoR2JvxOBsY1rqroBmzmk093PDotL7P08gKC
 nqInY6k6+td0SvNsDxUmvXWb3BtFohQSqA6m6wLAXEnpq05klahF/gtakgaRfbHU39
 1yGwYLv+zRyCIFLRUPjJfY5hj5om3/VeOyu5IxvL3CNFrTqPiRo94w1D9isb9aIrX5
 7JigCMnsmAh+XK2t7U2xZ0aq5fCWPh38WRXwa3A6oVhKZLLbR+0u54i2JdQ/qRPVG4
 0zTls9MTaawy/8gxjrbUPApkwUbtY8s8x+y7IWwNjUsu+IMVoiLzBO6LgKIMTGmVIn
 O/+9pmIb1QJHg==
Date: Mon, 2 Aug 2021 16:06:44 +0100
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v4 5/6] iova: Add iova_len argument to init_iova_domain()
Message-ID: <20210802150644.GD28735@willie-the-truck>
References: <1626259003-201303-1-git-send-email-john.garry@huawei.com>
 <1626259003-201303-6-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626259003-201303-6-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, mst@redhat.com,
 airlied@linux.ie, gregkh@linuxfoundation.org, linuxarm@huawei.com,
 jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, daniel@ffwll.ch, bingbu.cao@intel.com,
 digetx@gmail.com, mchehab@kernel.org, robin.murphy@arm.com,
 jasowang@redhat.com, tian.shu.qiu@intel.com
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

On Wed, Jul 14, 2021 at 06:36:42PM +0800, John Garry wrote:
> Add max opt argument to init_iova_domain(), and use it to set the rcaches
> range.
> 
> Also fix up all users to set this value (at 0, meaning use default).

Wrap that in init_iova_domain_defaults() to avoid the mysterious 0?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
