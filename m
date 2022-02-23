Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4E34C0C9C
	for <lists.iommu@lfdr.de>; Wed, 23 Feb 2022 07:36:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 653C782419;
	Wed, 23 Feb 2022 06:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZgcHXCaEo_7; Wed, 23 Feb 2022 06:36:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DF74281D5F;
	Wed, 23 Feb 2022 06:36:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A04B1C0011;
	Wed, 23 Feb 2022 06:36:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97C71C0011
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 06:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F93B60F26
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 06:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-3-by1yGawT for <iommu@lists.linux-foundation.org>;
 Wed, 23 Feb 2022 06:36:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A04060D6B
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 06:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/iX0wAICLVMEM1N1QRmtagYvAxCkv3rP8cMN2xrU/F0=; b=1LSr7rAmQ8gLIePxkwSjmV52zI
 XxP3kWpPZm1/Ue2ppNdJud+IF3UugAVr8sazajGI9MK1YPeWEFbPVj+tHDjbGjiWeI1DEn43JFOm5
 kzpXI8vFDze19m1HGhImheK14zjFW2ESUV6xf9yVntJ5gB65BjhRNrQ66MCfkjyIqcFZtySp67xYG
 8Oeo0T5B28wYJObsGTz2dkUGXWpYRjo5CVp6A75OQNMMmtUJMefGhUdJBRknxp23/LwLchfBhZ1na
 RAxXD+FYJNRPAfXGpipRMirKlxOqANGEniZWMh/trLFa+bkaL5qxp9qf8aHyzfkymn8Ilg0Tj8Okc
 DEixtwzA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nMlGJ-00CzV0-8q; Wed, 23 Feb 2022 06:36:31 +0000
Date: Tue, 22 Feb 2022 22:36:31 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 2/9] gpu: host1x: Add context bus
Message-ID: <YhXV7x+MzE6yQ4J8@infradead.org>
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-3-mperttunen@nvidia.com>
 <YhUNiHiYdQfxJybk@infradead.org>
 <c0dee650-df1c-4fad-aa97-fb9eab03f3a2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0dee650-df1c-4fad-aa97-fb9eab03f3a2@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Tue, Feb 22, 2022 at 09:30:30PM +0000, Robin Murphy wrote:
> > But the pattern that this copies in arm_smmu_bus_init is really
> > ugly.  I think we need to figure out a way todo that without having
> > to export all the low-level bus types.
> 
> Yup, as it happens that was the first step on my mission :)
> 
> https://gitlab.arm.com/linux-arm/linux-rm/-/commits/iommu/bus
> 
> Still a way to go with the main meat of that work, though, so I was figuring
> this could probably land as-is and I'll sweep it up in due course.

Yes, that part looks very nice.  It would be great to get that merged
ASAP.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
