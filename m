Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B113D21B586
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 14:56:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3379E8994D;
	Fri, 10 Jul 2020 12:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmUd6dyPqaMZ; Fri, 10 Jul 2020 12:56:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AEBDF89741;
	Fri, 10 Jul 2020 12:56:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8E82C016F;
	Fri, 10 Jul 2020 12:56:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64FC7C016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 12:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 53CC487F1E
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 12:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9qNxZl_Ryb2 for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 12:56:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1644387EB6
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 12:56:05 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3C42220C; Fri, 10 Jul 2020 14:56:02 +0200 (CEST)
Date: Fri, 10 Jul 2020 14:56:00 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] iommu: Tidy up Kconfig for SoC IOMMUs
Message-ID: <20200710125600.GG27672@8bytes.org>
References: <7fb9c74dc6bd12a4619ca44c92408e91352f1be0.1593791968.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fb9c74dc6bd12a4619ca44c92408e91352f1be0.1593791968.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On Fri, Jul 03, 2020 at 05:03:19PM +0100, Robin Murphy wrote:
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Based on the current iommu/next branch.

Applied both, thanks Robin.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
