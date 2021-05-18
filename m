Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E8D387509
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 11:26:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C0F5403B0;
	Tue, 18 May 2021 09:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQxRkk3Md6Bt; Tue, 18 May 2021 09:26:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA2F403A1;
	Tue, 18 May 2021 09:26:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DCB2C0001;
	Tue, 18 May 2021 09:26:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DFE1C0001
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 603EC403AB
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NrI5znAIMn-9 for <iommu@lists.linux-foundation.org>;
 Tue, 18 May 2021 09:26:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D654B40390
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:26:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A7B292FA; Tue, 18 May 2021 11:26:19 +0200 (CEST)
Date: Tue, 18 May 2021 11:26:18 +0200
From: Joerg Roedel <joro@8bytes.org>
To: chenxiang <chenxiang66@hisilicon.com>
Subject: Re: [PATCH v3] iommu/iova: put free_iova_mem() outside of spinlock
 iova_rbtree_lock
Message-ID: <YKOIOkwWsay0YqoE@8bytes.org>
References: <1618816415-95649-1-git-send-email-chenxiang66@hisilicon.com>
 <YKOEHh5CECej06ah@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKOEHh5CECej06ah@8bytes.org>
Cc: will@kernel.org, iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linuxarm@openeuler.org, linuxarm@huawei.com
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

On Tue, May 18, 2021 at 11:08:47AM +0200, Joerg Roedel wrote:
> Looks good to me, but I'll wait for Robins opinion before applying.

Nevermind, just found the new version which Robin already acked.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
