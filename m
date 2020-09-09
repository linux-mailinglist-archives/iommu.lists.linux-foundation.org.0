Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D20D12627F9
	for <lists.iommu@lfdr.de>; Wed,  9 Sep 2020 09:05:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7BEB32E11D;
	Wed,  9 Sep 2020 07:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Idmpxx5BHIXl; Wed,  9 Sep 2020 07:05:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3DAF02E150;
	Wed,  9 Sep 2020 07:05:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14EDFC0051;
	Wed,  9 Sep 2020 07:05:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AE6CC0051
 for <iommu@lists.linux-foundation.org>; Wed,  9 Sep 2020 07:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 59FEA86E5C
 for <iommu@lists.linux-foundation.org>; Wed,  9 Sep 2020 07:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id taDk3j5-KKmt for <iommu@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 07:05:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 93ACD86E47
 for <iommu@lists.linux-foundation.org>; Wed,  9 Sep 2020 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OisEO4jaSIfeERIhkIAL872QnJzJXCLXxgUqnKpDARE=; b=SrydzyYRh+xGXT0KW6s048zloI
 52J0q13JFWSZKNdGubmRKwYrmt1vcToWiUp8aPCggtl7svrazZbQDIYelaDpdcoplz1wyl2qx7M7B
 Ny83Jqaay5fvT5oDuSdx2jjPa2SHsHaAvOug4P6P1Lby6vNzYCSYsS/OnOn5H3AepNNLWrd8wIsq0
 iRcT2Co0fVyMFXdJ4LNKzD+XKCfGgJdCylieR7oSDGdv6Tf0okYTkuvPlCHJzSr4Ma0YXqJR8DSUP
 3reQwJMbCDIus+ocYSl3r0fwjMa1RRSzTNLzjunQipU4u6MbFbE2PkFYBQroexsWLKxzjM492lLgU
 wDNPOfCw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kFuAm-0007pZ-Le; Wed, 09 Sep 2020 07:05:40 +0000
Date: Wed, 9 Sep 2020 08:05:40 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH V2 2/5] iommu: Add iommu_dma_free_cpu_cached_iovas function
Message-ID: <20200909070540.GA28245@infradead.org>
References: <20200903201839.7327-1-murphyt7@tcd.ie>
 <20200903201839.7327-3-murphyt7@tcd.ie>
 <b30be538-a4dd-987e-78df-ff23b703bbe3@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b30be538-a4dd-987e-78df-ff23b703bbe3@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
 Tom Murphy <murphyt7@tcd.ie>, linux-kernel@vger.kernel.org
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

> +static inline void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
> +                                                  struct iommu_domain
> *domain)

This adds a crazy long line.  Which is rather pointless as other
bits of code in the patch use the more compact two tab indentations
for the prototype continuation lines anyway.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
