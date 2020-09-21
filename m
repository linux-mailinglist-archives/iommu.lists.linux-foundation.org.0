Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D4E2725F1
	for <lists.iommu@lfdr.de>; Mon, 21 Sep 2020 15:43:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CD09D20346;
	Mon, 21 Sep 2020 13:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sobo3YMTuvtH; Mon, 21 Sep 2020 13:43:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8846720439;
	Mon, 21 Sep 2020 13:43:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76A73C0051;
	Mon, 21 Sep 2020 13:43:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53CF6C0051
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 13:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 490348725D
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 13:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3G2s4Ek2yzE for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 13:43:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CAA208725C
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 13:43:30 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D10B52084C;
 Mon, 21 Sep 2020 13:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600695810;
 bh=DmCZ7P6LNdCNVX2iURc2Tv+RTbArR0Kg1mI/ej12EbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eNUZiyd9+5I4cLqEMKfuSXtwPRVFP3NRk7NB0oqya/i5QIDgYnbqfsN9qWw0VpSiO
 J3wuGwe/sY9cVi/OknDUnRC74FuQf99iOQpTLGIF/MyBKc3G4nnCEX9sM2xKK/PSuf
 dID2QWoDSef6LQt4+jkZjo4oEeIB/T/U85CZd3VM=
Date: Mon, 21 Sep 2020 14:43:25 +0100
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v2 0/2] iommu/arm-smmu-v3: Improve cmdq lock efficiency
Message-ID: <20200921134324.GK2139@willie-the-truck>
References: <1598018062-175608-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598018062-175608-1-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: maz@kernel.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
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

On Fri, Aug 21, 2020 at 09:54:20PM +0800, John Garry wrote:
> As mentioned in [0], the CPU may consume many cycles processing
> arm_smmu_cmdq_issue_cmdlist(). One issue we find is the cmpxchg() loop to
> get space on the queue takes a lot of time once we start getting many
> CPUs contending - from experiment, for 64 CPUs contending the cmdq,
> success rate is ~ 1 in 12, which is poor, but not totally awful.
> 
> This series removes that cmpxchg() and replaces with an atomic_add,
> same as how the actual cmdq deals with maintaining the prod pointer.

I'm still not a fan of this. Could you try to adapt the hacks I sent before,
please? I know they weren't quite right (I have no hardware to test on), but
the basic idea is to fall back to a spinlock if the cmpxchg() fails. The
queueing in the spinlock implementation should avoid the contention.

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
