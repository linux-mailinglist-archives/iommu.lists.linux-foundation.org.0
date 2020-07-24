Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A02C622C51A
	for <lists.iommu@lfdr.de>; Fri, 24 Jul 2020 14:26:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4536786D6C;
	Fri, 24 Jul 2020 12:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzPn2b5RPF0A; Fri, 24 Jul 2020 12:26:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D926686DC2;
	Fri, 24 Jul 2020 12:26:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE7A3C004C;
	Fri, 24 Jul 2020 12:26:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38129C004C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 12:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2E759883ED
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 12:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBwjodXTgmIK for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 12:26:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 72BFF883C0
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 12:26:38 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7BF3346A; Fri, 24 Jul 2020 14:26:34 +0200 (CEST)
Date: Fri, 24 Jul 2020 14:26:33 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] iommu/arm-smmu: Updates for 5.9
Message-ID: <20200724122632.GS27672@8bytes.org>
References: <20200721080352.GA13023@willie-the-truck>
 <20200722133323.GG27672@8bytes.org>
 <20200724115109.GA17451@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724115109.GA17451@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel-team@android.com, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
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

Hi Will,

On Fri, Jul 24, 2020 at 12:51:09PM +0100, Will Deacon wrote:
> Sure, that makes sense to me: I've included a diff below in case anybody
> has comments. I've tackled it slightly differently to how the intel and
> amd drivers are handled, since we have a header file (arm-smmu.h) which
> is shared by a couple of different drivers. I've also moved the v3 driver
> under the arm/ directory as Jean Philippe plans to split out the SVA work
> for 5.10.
> 
> I'll send a second pull early next week if there are no objections (or
> you can pick this patch directly).

Thanks, the diff looks fine to me.


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
