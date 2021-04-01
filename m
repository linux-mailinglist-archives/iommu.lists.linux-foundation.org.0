Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F3351150
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 10:58:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C0E74029B;
	Thu,  1 Apr 2021 08:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyqmOUnyIemd; Thu,  1 Apr 2021 08:58:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E66D40296;
	Thu,  1 Apr 2021 08:58:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B14DC000A;
	Thu,  1 Apr 2021 08:58:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81D2FC000A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 08:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62C584029B
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 08:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPsoxpr3afCj for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 08:58:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51F0940296
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 08:58:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBF966023B;
 Thu,  1 Apr 2021 08:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617267480;
 bh=qO5GnDQBxqX1f7x9zAi73eBzkaFPHd3HL6PpBB85bdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OMfEcbl8tYPuX5WDV/d/OgcbQ4JUHkcqvauo65fQCWGZLSdEOyJdCKSebhVJ5N139
 /fRmtaxVbip3YDuWsFYMDKtqOs4Xd6epo3gS2N5xpJGPgHVdEmamYy7AzcvpXEosP2
 qaAd6IDmnhCg0n7BzRjeM+uRDfm+lbEw99nW4yPoCwBO0cqaESOj+V5MerHHeW8TwP
 w/xULX4IvKezvZLKNY9Q++cRvNJE/SGXScv/NODcscd25v0fvpY8fZHzqK5YpQ/PLl
 VRd1Aqr7RG76L5N8GCV0LhxcM4vdJWBwAMaTWReNAjFSSH9L/gNBndS5BG4l0MiV54
 I1y0PfrhuBuIw==
Date: Thu, 1 Apr 2021 09:57:52 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v13 00/10] iommu: I/O page faults for SMMUv3
Message-ID: <20210401085752.GA8781@willie-the-truck>
References: <20210302092644.2553014-1-jean-philippe@linaro.org>
 <YGNdQ863Mohizx7A@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGNdQ863Mohizx7A@myrica>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: vivek.gautam@arm.com, guohanjun@huawei.com, linux-acpi@vger.kernel.org,
 zhangfei.gao@linaro.org, lenb@kernel.org, devicetree@vger.kernel.org,
 kevin.tian@intel.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 rjw@rjwysocki.net, iommu@lists.linux-foundation.org, sudeep.holla@arm.com,
 robin.murphy@arm.com, linux-accelerators@lists.ozlabs.org
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

On Tue, Mar 30, 2021 at 07:17:55PM +0200, Jean-Philippe Brucker wrote:
> On Tue, Mar 02, 2021 at 10:26:36AM +0100, Jean-Philippe Brucker wrote:
> > Add stall support to the SMMUv3 driver, along with a common I/O Page
> > Fault handler.
> 
> I only have review/ack tags and one assert_lockdep to add to this series.
> Should I send a v14 now or wait a little longer?  Just making sure we can
> get at least patches 1-6 in v5.13.

Easiest thing is probably to send a v14 containing just the patches
targetting v5.13, so that Joerg can queue them up.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
