Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 886273059C2
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 12:31:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D9CBA8650E;
	Wed, 27 Jan 2021 11:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRsut0TSJARO; Wed, 27 Jan 2021 11:31:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED8FD8664B;
	Wed, 27 Jan 2021 11:31:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3137C013A;
	Wed, 27 Jan 2021 11:31:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5E10C013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 11:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A0644864B2
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 11:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZWutJzm1qh8 for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 11:31:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 496F9861D4
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 11:31:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5E9A5303; Wed, 27 Jan 2021 12:31:31 +0100 (CET)
Date: Wed, 27 Jan 2021 12:31:30 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Adrian Huang <adrianhuang0701@gmail.com>
Subject: Re: [RESEND PATCH 1/1] iommu/amd: Remove unnecessary assignment
Message-ID: <20210127113129.GB32671@8bytes.org>
References: <20201210021330.2022-1-adrianhuang0701@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210021330.2022-1-adrianhuang0701@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Adrian Huang <ahuang12@lenovo.com>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>
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

On Thu, Dec 10, 2020 at 10:13:30AM +0800, Adrian Huang wrote:
>  drivers/iommu/amd/init.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
