Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01827B76D
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 00:39:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ADE9A870C4;
	Mon, 28 Sep 2020 22:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuWJvqPTJyKu; Mon, 28 Sep 2020 22:39:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F86B870DE;
	Mon, 28 Sep 2020 22:39:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38762C0893;
	Mon, 28 Sep 2020 22:39:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C197C0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 36A188638F
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llSfXZQSdV38 for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 22:39:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B265C86378
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:39:07 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14C3723A40;
 Mon, 28 Sep 2020 22:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601332747;
 bh=f4ZQSt3pR5sUGDEhV7AvAXre9Y3Kz20ZEPTc47P6QYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=teJlbJD6RskFQoERAZkk4NssFmFOy/ipzuHup0Ue8nvp0BD1VcEgCenDGVy9+QEUu
 xE12PgqxLENduRx9T2UmSEEc1ebop/P6cgP9bm8V16FyvLSR8JPwBTZPCWTdjlmEah
 ahv52/3nqektj8YkyjbWgWVYkXuRwN8ut1QT1icw=
Date: Mon, 28 Sep 2020 23:39:02 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v10 00/13] iommu: Shared Virtual Addressing for SMMUv3
 (PT sharing part)
Message-ID: <20200928223901.GB12847@willie-the-truck>
References: <20200918101852.582559-1-jean-philippe@linaro.org>
 <20200928164731.GB1459218@myrica>
 <20200928172315.GA11792@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928172315.GA11792@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: fenghua.yu@intel.com, linux-mm@kvack.org, catalin.marinas@arm.com,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

On Mon, Sep 28, 2020 at 06:23:15PM +0100, Will Deacon wrote:
> On Mon, Sep 28, 2020 at 06:47:31PM +0200, Jean-Philippe Brucker wrote:
> > On Fri, Sep 18, 2020 at 12:18:40PM +0200, Jean-Philippe Brucker wrote:
> > > This is version 10 of the page table sharing support for Arm SMMUv3.
> > > Patch 1 still needs an Ack from mm maintainers. However patches 4-11 do
> > > not depend on it, and could get merged for v5.10 regardless.
> > 
> > Are you OK with taking patches 4-11 for v5.10?
> > 
> > The rest depends on patch 1 which hasn't been acked yet. It's
> > uncontroversial and I'm sure it will eventually make it. In case it
> > doesn't, we'll keep track of mm->pasid within the IOMMU subsystem instead.
> 
> I was off most of last week, but I plan to see how much of this I can queue
> tonight. Stay tuned...

I've queued 4-11 locally, but I've put 4 and 6 on a shared branch with arm64
(for-next/svm) so I'd like that to hit next before I push out the merge into
the branch for Joerg.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
