Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C43620C6A6
	for <lists.iommu@lfdr.de>; Sun, 28 Jun 2020 09:10:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E538787D0C;
	Sun, 28 Jun 2020 07:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtN8z91Wb0rD; Sun, 28 Jun 2020 07:10:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F948878D8;
	Sun, 28 Jun 2020 07:10:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F13D1C08A6;
	Sun, 28 Jun 2020 07:10:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27702C016E
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 07:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 13C39881B7
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 07:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvVZ3TmH8E1Z for <iommu@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 07:10:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CDF7E8818F
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 07:10:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 301AC68AFE; Sun, 28 Jun 2020 09:10:15 +0200 (CEST)
Date: Sun, 28 Jun 2020 09:10:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: Passing NULL dev to dma_alloc_coherent() allowed or not?
Message-ID: <20200628071014.GA16213@lst.de>
References: <1669515915.65540.1593258316061.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1669515915.65540.1593258316061.JavaMail.zimbra@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, hch@lst.de,
 dan.carpenter@oracle.com
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

You can't pass NULL.  The synclink case is dead code as we stopped
supporting non-PCI adapters a while ago.  I had a patch to remove
the !PCI code a while ago, but it seems like it never made it upstream.

The staging code is, well .. staging code.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
