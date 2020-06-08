Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E53531F1462
	for <lists.iommu@lfdr.de>; Mon,  8 Jun 2020 10:18:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 29AF18666C;
	Mon,  8 Jun 2020 08:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-Tvi8Hh+lMw; Mon,  8 Jun 2020 08:18:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D0F88666F;
	Mon,  8 Jun 2020 08:18:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 300ECC016F;
	Mon,  8 Jun 2020 08:18:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4A04C016F
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 08:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B1A8487C41
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 08:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8n3bhUXmGnM for <iommu@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 08:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3265D87C20
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 08:18:52 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86E3A20656;
 Mon,  8 Jun 2020 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591604331;
 bh=/IVx+9cPa/hdjtqn+bLeDhAxS+2dke/9caQWfUasXMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nX2kx0ZJvQ6eZb5gFid2h2iyefJIxDMhLvhqHQ4r8PSN5juMtyzG6Rk24zGvO1Rsy
 YWYrlfUa7aCsUXURPJMHFxn4msfRGLefqDnBmBLqgQrVlSjZWwHAIHDjTXHV99AK/q
 dYwj7VLYrifpUdMj+buPBiepFMcBy74p2nfhMrh0=
Date: Mon, 8 Jun 2020 09:18:46 +0100
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [RFC PATCH] iommu/arm-smmu: Remove shutdown callback
Message-ID: <20200608081846.GA1542@willie-the-truck>
References: <20200607110918.1733-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607110918.1733-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Sun, Jun 07, 2020 at 04:39:18PM +0530, Sai Prakash Ranjan wrote:
> Remove SMMU shutdown callback since it seems to cause more
> problems than benefits. With this callback, we need to make
> sure that all clients/consumers of SMMU do not perform any
> DMA activity once the SMMU is shutdown and translation is
> disabled. In other words we need to add shutdown callbacks
> for all those clients to make sure they do not perform any
> DMA or else we see all kinds of weird crashes during reboot
> or shutdown. This is clearly not scalable as the number of
> clients of SMMU would vary across SoCs and we would need to
> add shutdown callbacks to almost all drivers eventually.
> This callback was added for kexec usecase where it was known
> to cause memory corruptions when SMMU was not shutdown but
> that does not directly relate to SMMU because the memory
> corruption could be because of the client of SMMU which is
> not shutdown properly before booting into new kernel. So in
> that case, we need to identify the client of SMMU causing
> the memory corruption and add appropriate shutdown callback
> to the client rather than to the SMMU.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu-v3.c | 6 ------
>  drivers/iommu/arm-smmu.c    | 6 ------
>  2 files changed, 12 deletions(-)

This feels like a giant bodge to me and I think that any driver which
continues to perform DMA after its ->shutdown() function has been invoked
is buggy. Wouldn't that cause problems with kexec(), for example?

There's a clear shutdown dependency ordering, where the clients of the
SMMU need to shutdown before the SMMU itself, but that's not really
the SMMU driver's problem to solve.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
