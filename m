Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58321EB2B
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 10:19:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 19B9C8A679;
	Tue, 14 Jul 2020 08:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5y3kf9gQBnCq; Tue, 14 Jul 2020 08:19:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9C88B8A67A;
	Tue, 14 Jul 2020 08:19:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87D21C0733;
	Tue, 14 Jul 2020 08:19:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAEE4C0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9A04C8A898
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9BLxogI4NRj for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:19:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 286B989D9E
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:19:55 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE03B21841;
 Tue, 14 Jul 2020 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594714795;
 bh=y+kMcjwj62DUaai6UaM9R3NF5UPVqYjpo4MPe+fl5/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EwN9vIxQSjaO9e8cUaJo+M3xEPCfTIwpe+D7LX6937JtKIX+pAe1YSSToA2FrjOt9
 BILjibwYsmo1ymsbfg8G9rGHEfj2UVC/9m9Np3VWOIAbcuAqD+976EzWmJBTPeUh6t
 AdZFrIsLB/+40Nck+WUu2TdBz3I+bLlgf4iFlT1k=
Date: Tue, 14 Jul 2020 09:19:49 +0100
From: Will Deacon <will@kernel.org>
To: Tomasz Nowicki <tn@semihalf.com>
Subject: Re: [PATCH v3 0/4] Add system mmu support for Armada-806
Message-ID: <20200714081949.GA4516@willie-the-truck>
References: <20200702201633.22693-1-tn@semihalf.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702201633.22693-1-tn@semihalf.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, gregory.clement@bootlin.com,
 catalin.marinas@arm.com, hannah@marvell.com, linux-kernel@vger.kernel.org,
 nadavh@marvell.com, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 mw@semihalf.com, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

Hi Tomasz,

On Thu, Jul 02, 2020 at 10:16:29PM +0200, Tomasz Nowicki wrote:
> There were already two versions of series to support SMMU for AP806,
> including workaround for accessing ARM SMMU 64bit registers.
> First [1] by Hanna Hawa and second [2] by Gregory CLEMENT.
> Since it got stuck this is yet another try. I incorporated the V2 comments,
> mainly by moving workaround code to arm-smmu-impl.c as requested.
> 
> For the record, AP-806 can't access SMMU registers with 64bit width,
> this patches split the readq/writeq into two 32bit accesses instead
> and update DT bindings.
> 
> The series was successfully tested on a vanilla v5.8-rc3 kernel and
> Intel e1000e PCIe NIC. The same for platform devices like SATA and USB.
> 
> [1]: https://lkml.org/lkml/2018/10/15/373
> [2]: https://lkml.org/lkml/2019/7/11/426

Do you have a v4 of this series? It looks like there were a few comments
left to address, but with that I can pick it up for 5.9.

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
