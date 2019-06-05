Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F96835C6B
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 14:19:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 16186C6E;
	Wed,  5 Jun 2019 12:19:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 58E4E9BA
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 12:19:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id EE5B634F
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 12:19:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 993C180D;
	Wed,  5 Jun 2019 05:19:04 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC1EB3F246;
	Wed,  5 Jun 2019 05:19:02 -0700 (PDT)
Date: Wed, 5 Jun 2019 13:19:00 +0100
From: Will Deacon <will.deacon@arm.com>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, joro@8bytes.org
Subject: Re: [PATCH v3] iommu/arm-smmu: Avoid constant zero in TLBI writes
Message-ID: <20190605121900.GJ15030@fuggles.cambridge.arm.com>
References: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
	<20190529130559.GB11023@fuggles.cambridge.arm.com>
	<84791515-e0ae-0322-78aa-02ca0b40d157@free.fr>
	<09a290f1-27a0-5ee3-16b9-659ef2ba99dc@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09a290f1-27a0-5ee3-16b9-659ef2ba99dc@free.fr>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
	MSM <linux-arm-msm@vger.kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	iommu <iommu@lists.linux-foundation.org>, Andy Gross <agross@kernel.org>,
	AngeloGioacchino Del Regno <kholk11@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

[+Joerg on To:]

On Mon, Jun 03, 2019 at 02:15:37PM +0200, Marc Gonzalez wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Apparently, some Qualcomm arm64 platforms which appear to expose their
> SMMU global register space are still, in fact, using a hypervisor to
> mediate it by trapping and emulating register accesses. Sadly, some
> deployed versions of said trapping code have bugs wherein they go
> horribly wrong for stores using r31 (i.e. XZR/WZR) as the source
> register.
> 
> While this can be mitigated for GCC today by tweaking the constraints
> for the implementation of writel_relaxed(), to avoid any potential
> arms race with future compilers more aggressively optimising register
> allocation, the simple way is to just remove all the problematic
> constant zeros. For the write-only TLB operations, the actual value is
> irrelevant anyway and any old nearby variable will provide a suitable
> GPR to encode. The one point at which we really do need a zero to clear
> a context bank happens before any of the TLB maintenance where crashes
> have been reported, so is apparently not a problem... :/
> 
> Reported-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Acked-by: Will Deacon <will.deacon@arm.com>

Joerg -- Please can you take this as a fix for 5.2, with a Cc stable?

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
