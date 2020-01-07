Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5540D1326F3
	for <lists.iommu@lfdr.de>; Tue,  7 Jan 2020 14:03:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0521884065;
	Tue,  7 Jan 2020 13:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GbP3rJv8uVOj; Tue,  7 Jan 2020 13:03:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5EA383612;
	Tue,  7 Jan 2020 13:03:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DC86C0881;
	Tue,  7 Jan 2020 13:03:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 123EFC0881
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 13:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F020B83500
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 13:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d0gxjiGSbB9O for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 13:03:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8F5CE834D2
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 13:03:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8A03F485; Tue,  7 Jan 2020 14:03:37 +0100 (CET)
Date: Tue, 7 Jan 2020 14:03:32 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Patrick Steinhardt <ps@pks.im>
Subject: Re: [PATCH] iommu/vt-d fix adding non-PCI devices to Intel IOMMU
Message-ID: <20200107130331.GA30567@8bytes.org>
References: <b47f83548d855ac920ad06b0ff78b877fa4f5189.1577404477.git.ps@pks.im>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b47f83548d855ac920ad06b0ff78b877fa4f5189.1577404477.git.ps@pks.im>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Fri, Dec 27, 2019 at 12:56:18AM +0100, Patrick Steinhardt wrote:
> 
> I've recently spotted above warning in v5.5-rc3. The attached fix
> is rather intended as a discussion starter -- it's quite likely
> to be wrong as I ain't got much of a clue about the IOMMU
> subsystem.
> 
>  drivers/iommu/intel-iommu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied for v5.5.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
