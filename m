Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECDC3039E8
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 11:12:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1019C8703D;
	Tue, 26 Jan 2021 10:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oC6djDoKUMKN; Tue, 26 Jan 2021 10:12:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D6A2385459;
	Tue, 26 Jan 2021 10:12:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3551C013A;
	Tue, 26 Jan 2021 10:12:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F598C013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 10:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7DC218487A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 10:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihH_gE4IRdDu for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 10:12:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2199184400
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 10:12:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8220621744;
 Tue, 26 Jan 2021 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611655956;
 bh=BROfFJpIRH8LJFhVQkvm8o4ilhu1UZ/b8i19pQZDBU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qs6j8xg8KD+LFQ4ba99/rlxMYwy852TGndWKrQeutD+cmQ7e4e9nbgDexbo7KcmjK
 XOSlgAZyPQFLDmNfCQ6gDrZSSI0t1CNkLbvQAhKq6fgxtdT5FRcK2ein2dDYSo/Ihy
 1VRxAlxScThrtP8c2ii+mQVi8FONx2QuevopN46+AuPiNtg3V/yzO6u6UKV+TO5KpK
 r8yRcmyrP3i/Wo68zk9EStdkPV3HI0kEGSwRcMAVr6dPu0vMGkmXeKFeDAj258uhQQ
 kftvksihNAzk+y1sufWPmA0cm/B0fjh3d21mrUsK+UGzaEfWl9hKxjxr61W+rVEwQJ
 kRsytr8zP5RIg==
Date: Tue, 26 Jan 2021 10:12:31 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: add support for BBML
Message-ID: <20210126101230.GA29204@willie-the-truck>
References: <20201126034230.777-1-thunder.leizhen@huawei.com>
 <20210122125132.GB24102@willie-the-truck>
 <aac11411-f6cd-f990-fe53-db0d8c07f3a0@huawei.com>
 <1bfd1ca0-953e-e943-f87e-144d5537bd0c@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bfd1ca0-953e-e943-f87e-144d5537bd0c@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 iommu <iommu@lists.linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Mon, Jan 25, 2021 at 08:23:40PM +0000, Robin Murphy wrote:
> Now we probably will need some degreee of BBML feature awareness for the
> sake of SVA if and when we start using it for CPU pagetables, but I still
> cannot see any need to consider it in io-pgtable.

Agreed; I don't think this is something that io-pgtable should have to care
about.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
