Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B60EB52E990
	for <lists.iommu@lfdr.de>; Fri, 20 May 2022 12:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5156A6135D;
	Fri, 20 May 2022 10:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BamJPuVJhMB1; Fri, 20 May 2022 10:03:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 532CB61360;
	Fri, 20 May 2022 10:03:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1BDAC002D;
	Fri, 20 May 2022 10:03:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20227C002D
 for <iommu@lists.linux-foundation.org>; Fri, 20 May 2022 10:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F42442531
 for <iommu@lists.linux-foundation.org>; Fri, 20 May 2022 10:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q9EL-hOUUO4t for <iommu@lists.linux-foundation.org>;
 Fri, 20 May 2022 10:03:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CCA641B8F
 for <iommu@lists.linux-foundation.org>; Fri, 20 May 2022 10:03:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AF77522A; Fri, 20 May 2022 12:03:03 +0200 (CEST)
Date: Fri, 20 May 2022 12:03:02 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v3 00/35] iommu/amd: Add multiple PCI segments support
Message-ID: <YodnVsHH8B6ypep0@8bytes.org>
References: <20220511072141.15485-1-vasant.hegde@amd.com>
 <3b3b668f-64e1-1713-9126-59c7313bd894@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b3b668f-64e1-1713-9126-59c7313bd894@amd.com>
Cc: iommu@lists.linux-foundation.org
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

Hi Vasant,

On Fri, May 20, 2022 at 03:25:38PM +0530, Vasant Hegde wrote:
> Ping. Did you get a chance to look into this series?

Sorry, too late for this round. The changes are pretty invasive and
merging them at -rc7 stage would not give them enough testing before
being merged. Please send me a reminder after the next merge window.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
