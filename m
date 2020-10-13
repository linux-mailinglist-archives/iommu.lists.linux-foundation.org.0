Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 270FA28CC99
	for <lists.iommu@lfdr.de>; Tue, 13 Oct 2020 13:29:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E084E86BBC;
	Tue, 13 Oct 2020 11:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMX0b68msApp; Tue, 13 Oct 2020 11:29:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2827286B88;
	Tue, 13 Oct 2020 11:29:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08F8BC0051;
	Tue, 13 Oct 2020 11:29:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBE81C0051
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 11:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A357D86DF3
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 11:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oP7zxW5B2kcY for <iommu@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 11:29:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 588BE86DED
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 11:29:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 96AB167373; Tue, 13 Oct 2020 13:29:12 +0200 (CEST)
Date: Tue, 13 Oct 2020 13:29:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/9] dma-mapping: split <linux/dma-mapping.h>
Message-ID: <20201013112912.GA13438@lst.de>
References: <20200930085548.920261-1-hch@lst.de>
 <20200930085548.920261-2-hch@lst.de> <20201011143327.GA251807@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201011143327.GA251807@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-arch@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

Thanks for the report, I've commited the obvious fix.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
