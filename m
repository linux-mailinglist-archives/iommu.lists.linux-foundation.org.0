Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F9175EA1
	for <lists.iommu@lfdr.de>; Mon,  2 Mar 2020 16:44:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0AFED85817;
	Mon,  2 Mar 2020 15:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GYGXsnlYWJq; Mon,  2 Mar 2020 15:44:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 94DA684A0D;
	Mon,  2 Mar 2020 15:44:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84F90C013E;
	Mon,  2 Mar 2020 15:44:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 014FBC013E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 15:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E44CF203F5
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 15:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYlFDvt4nN+B for <iommu@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 15:44:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 9A95220399
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 15:44:32 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8CC755BC; Mon,  2 Mar 2020 16:44:30 +0100 (CET)
Date: Mon, 2 Mar 2020 16:44:27 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH] iommu: silence iommu group prints
Message-ID: <20200302154426.GC6540@8bytes.org>
References: <E1j7Hnc-0004Bm-Kn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1j7Hnc-0004Bm-Kn@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Feb 27, 2020 at 11:57:52AM +0000, Russell King wrote:
> On the LX2160A, there are lots (about 160) of IOMMU messages produced
> during boot; this is excessive.  Reduce the severity of these messages
> to debug level.

No, these messages are a very useful tool when it comes to debugging
IOMMU issues on other platforms, and the user only has to provide dmesg
output. When your system has 160 devices, so be it.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
