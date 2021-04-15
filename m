Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB4360D29
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 16:58:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8645560D6C;
	Thu, 15 Apr 2021 14:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61RUmVNXd4SS; Thu, 15 Apr 2021 14:58:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4552560D9B;
	Thu, 15 Apr 2021 14:58:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11C67C000A;
	Thu, 15 Apr 2021 14:58:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51E10C000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 14:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B33040220
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 14:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96Dx_ZGXPODO for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 14:58:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E454B4021B
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5590gHpbK5FgZNV6w4mBWeptu22O3ONqcmsDN5oTQWM=; b=hwkUtgWDfy9MIDQrmjeIiVdmZB
 Ns1dR9E5us/LETy9j3UJv40A6Ya7U3V+rd0cs2BWa/WL3oxxi8ntp1x2xkyrHBGO4oNuzCDpFy0hP
 IdzmW09/Dc7K3keRdaxjs0RXjZOM5rOFazwBL/P15vzKTfOikcG6xe3R7YnYIpNIq08wyP+TBpjhA
 GNdg+NP2E7AW6hVii+xSMaCd5S1UqTZ2pwnGQV+hRSVfXgxu//wLLXLGAv9wEiho1OSa2l/5BUre7
 Khdujyc6QrBD4HcFEaF3EQcoSVZT5o0bUu0xNPNrhP6C5mm53pHX4dkrD6hVnEkJEix1Bv7C0v3O5
 qlY3gUMw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lX3R7-008hrh-2Z; Thu, 15 Apr 2021 14:57:46 +0000
Date: Thu, 15 Apr 2021 15:57:41 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu/fsl-pamu: Fix uninitialized variable warning
Message-ID: <20210415145741.GA2074523@infradead.org>
References: <20210415144442.25103-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415144442.25103-1-joro@8bytes.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
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

On Thu, Apr 15, 2021 at 04:44:42PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The variable 'i' in the function update_liodn_stash() is not
> initialized and only used in a debug printk(). So it has no
> meaning at all, remove it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Sorry for introducing this.  The fix looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
