Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D51C360AAB
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 15:41:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E66606FF;
	Thu, 15 Apr 2021 13:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjp8nEwoBOhd; Thu, 15 Apr 2021 13:41:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B6960695;
	Thu, 15 Apr 2021 13:41:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E42A0C000A;
	Thu, 15 Apr 2021 13:41:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCA5EC000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 13:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DAD984722
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 13:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PjeYvTda29pn for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 13:41:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F05884714
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 13:41:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 787CA387; Thu, 15 Apr 2021 15:41:52 +0200 (CEST)
Date: Thu, 15 Apr 2021 15:41:51 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 0/2] iommu/amd: Revert and remove failing PMC test
Message-ID: <YHhCn2a+oi7/y7ZP@8bytes.org>
References: <20210409085848.3908-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210409085848.3908-1-suravee.suthikulpanit@amd.com>
Cc: pmenzel@molgen.mpg.de, Jon.Grimm@amd.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, will@kernel.org
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

On Fri, Apr 09, 2021 at 03:58:46AM -0500, Suravee Suthikulpanit wrote:
> Paul Menzel (1):
>   Revert "iommu/amd: Fix performance counter initialization"
> 
> Suravee Suthikulpanit (1):
>   iommu/amd: Remove performance counter pre-initialization test

Applied, thanks Paul and Suravee.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
