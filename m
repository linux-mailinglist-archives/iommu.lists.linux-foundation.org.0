Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1103D1642E3
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 12:03:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 942AA867D0;
	Wed, 19 Feb 2020 11:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pCEQaPZdVky9; Wed, 19 Feb 2020 11:03:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39CA0867C6;
	Wed, 19 Feb 2020 11:03:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 222B8C013E;
	Wed, 19 Feb 2020 11:03:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC640C013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 11:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D860D204EA
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 11:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uqv70j0eeXsa for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 11:03:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 6479F203CF
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 11:03:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CC46836A; Wed, 19 Feb 2020 12:03:44 +0100 (CET)
Date: Wed, 19 Feb 2020 12:03:43 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu: Restore naming of driver parameter prefix
Message-ID: <20200219110343.GG1961@8bytes.org>
References: <20200218172756.2131-1-will@kernel.org>
 <90975c71-9089-b857-6b22-804415e4d5cb@arm.com>
 <20200219110046.GC16824@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219110046.GC16824@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Robin Murphy <robin.murphy@arm.com>, Russell King <linux@armlinux.org.uk>,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
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

On Wed, Feb 19, 2020 at 11:00:46AM +0000, Will Deacon wrote:
> Joerg -- please can you pick this up as a fix for 5.6? I don't have any
> other SMMU fixes queued, so it doesn't seem worth sending a pull request
> to you just for this.

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
