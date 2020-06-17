Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 963DD1FC770
	for <lists.iommu@lfdr.de>; Wed, 17 Jun 2020 09:31:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 12835886C2;
	Wed, 17 Jun 2020 07:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udMr4bG+pCXR; Wed, 17 Jun 2020 07:31:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24E57886B0;
	Wed, 17 Jun 2020 07:31:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D07DC016E;
	Wed, 17 Jun 2020 07:31:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11456C016E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 07:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 05164878A8
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 07:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMQk3Qwene4n for <iommu@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 07:31:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 70D7B87895
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VsRI05MA0gDChQhjvYubCNupJCQDGQ1QnOVaSmjuu3k=; b=kWk0gBemtnwCgsITYbRvHBkqjL
 3AIZtFbTmv21DTS/4oF9tbP5Cw3TPXVdxBOY81ArT9mVW8FSDhBY7/wqvYgjiNCoLrnwr09vJdtxo
 wlpRbOv9RoQiILqqXKpWMZ3npQkUS6VGIPHDsyIPVCfczXbhIiKWlt6OdSMSJmjiEtXbEayG8hZgI
 9D1WAtQYuGmfhV3iI/eO30JWOn0AHGCv/XAx4M1Gp8Xk5fPC/qoEkttIX36nrzTBHnJRM7yqJh0w/
 XOpf6uRZ+TQoK0ltVPX0CVqKVZ9M1OMERNukKHKSDAv4dwE1AMfFHLsyGb+OmDXa6WZBNxYKTtl2l
 h3h2aWDg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jlSXE-0006rs-QY; Wed, 17 Jun 2020 07:31:00 +0000
Date: Wed, 17 Jun 2020 00:31:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH 4/4] pci: export untrusted attribute in sysfs
Message-ID: <20200617073100.GA14424@infradead.org>
References: <20200616011742.138975-1-rajatja@google.com>
 <20200616011742.138975-4-rajatja@google.com>
 <20200616073249.GB30385@infradead.org>
 <CACK8Z6ELaM8KxbwPor=BUquWN7pALQmmHu5geSOc71P3KoJ1QA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACK8Z6ELaM8KxbwPor=BUquWN7pALQmmHu5geSOc71P3KoJ1QA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Todd Broch <tbroch@google.com>, linux-pci <linux-pci@vger.kernel.org>,
 "Krishnakumar, Lalithambika" <lalithambika.krishnakumar@intel.com>,
 Diego Rivas <diegorivas@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, Raj Ashok <ashok.raj@intel.com>,
 Christoph Hellwig <hch@infradead.org>, linux-acpi@vger.kernel.org,
 Christian Kellner <christian@kellner.me>,
 Mattias Nissler <mnissler@google.com>, Jesse Barnes <jsbarnes@google.com>,
 Len Brown <lenb@kernel.org>, Rajat Jain <rajatxjain@gmail.com>,
 Prashant Malani <pmalani@google.com>, Aaron Durbin <adurbin@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Bernie Keany <bernie.keany@intel.com>, Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Oliver O'Halloran <oohall@gmail.com>,
 Benson Leung <bleung@google.com>, David Woodhouse <dwmw2@infradead.org>,
 Alex Levin <levinale@google.com>
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

On Tue, Jun 16, 2020 at 12:27:35PM -0700, Rajat Jain wrote:
> Need clarification. The flag "untrusted" is currently a part of
> pci_dev struct, and is populated within the PCI subsystem.

Yes, and that is the problem.

> 
> 1) Is your suggestion to move this flag as well as the attribute to
> device core (in "struct device")? This would allow other buses to
> populate/use this flag if they want. By default it'll be set to 0 for
> all devices (PCI subsystem will populate it based on platform info,
> like it does today).
> 
> OR
> 
> 2) Are you suggesting to keep the "untrusted" flag within PCI, but
> attach the sysfs attribute to the base device? (&pci_dev->dev)?

(1).  As for IOMMUs and userspace policy it really should not matter
what bus a device is on if it is external and not trustworthy.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
