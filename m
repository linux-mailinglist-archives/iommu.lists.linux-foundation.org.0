Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 44866140753
	for <lists.iommu@lfdr.de>; Fri, 17 Jan 2020 11:06:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E93C386E1D;
	Fri, 17 Jan 2020 10:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ng21Ivy-WYUe; Fri, 17 Jan 2020 10:06:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E07AC86E26;
	Fri, 17 Jan 2020 10:06:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B55F6C1D8D;
	Fri, 17 Jan 2020 10:06:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3480C077D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EC4A12040C
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 686VwPjZKy9V for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 10:06:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 2DA7B1FEDF
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:06:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 96FDE327; Fri, 17 Jan 2020 11:06:25 +0100 (CET)
Date: Fri, 17 Jan 2020 11:06:24 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Adrian Huang <adrianhuang0701@gmail.com>
Subject: Re: [PATCH 0/2] iommu/amd: Optimization and cleanup for unused
 variables
Message-ID: <20200117100623.GD15760@8bytes.org>
References: <20200109030251.5782-1-ahuang12@lenovo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109030251.5782-1-ahuang12@lenovo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

On Thu, Jan 09, 2020 at 11:02:49AM +0800, Adrian Huang wrote:
> This series optimizes the register reading by using readq instead of
> readl and cleans up the unused variables.
> 
> Adrian Huang (2):
>   iommu/amd: Replace two consecutive readl calls with one readq
>   iommu/amd: Remove unused struct member

Applied, thanks Adrian.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
