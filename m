Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F0253733
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 20:32:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1C9987727;
	Wed, 26 Aug 2020 18:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Txv-ehv55zym; Wed, 26 Aug 2020 18:32:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 15F7F877F5;
	Wed, 26 Aug 2020 18:32:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03953C0051;
	Wed, 26 Aug 2020 18:32:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74645C0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 18:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6301C87727
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 18:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7N0lzHH-UlG for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 18:32:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BD58E86CE7
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 18:32:03 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598466720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mcTYQk36xBHukMp+WJuA1pj5lQ7N0s5iLLvD6sbf4dI=;
 b=fpQJ5YLBnvP7eAvuuPZvNlzVE1yTFcC3m3p/OK2mKng6MKzf3xJQ97zpjk50GBCGR++Mre
 +pgDtjis/z2lxl0mueMP/XNS2M2nPBkot5+qPqiVJCBQ/W9GT2KLQsWzsblyXqI7xk9Y8J
 roh1ow11MUTyUeBFLCHpFkeHlpyiJXB8f/ujjD+ENJKWULtVlh++5rPVPYIdNBW5xJzjAU
 xedCxtQd/w/Z7ftQZGGv+P6MRtuQ1A/w2yA7RqrxqjzWO3u1m3+x5VkFhOgAd7OyZmLGfU
 8pUhoxzbcQe/wCfP728HKYhDmfO5rY17aQ6x1+J8OjTq+KXAReAUeZfIxeDzdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598466720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mcTYQk36xBHukMp+WJuA1pj5lQ7N0s5iLLvD6sbf4dI=;
 b=pkoroG5YpMQGTbQ7l7+BLWF/OnpZqytmtTgmIbXHObF2YG1hspbzv/wff3q1nSoqlXa6Ac
 WfvFdMD10A4T26DQ==
To: "Dey\, Megha" <megha.dey@intel.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V2 15/46] x86/irq: Consolidate DMAR irq allocation
In-Reply-To: <812d9647-ad2e-95e9-aa99-b54ff7ebc52d@intel.com>
References: <20200826111628.794979401@linutronix.de>
 <20200826112332.163462706@linutronix.de>
 <812d9647-ad2e-95e9-aa99-b54ff7ebc52d@intel.com>
Date: Wed, 26 Aug 2020 20:32:00 +0200
Message-ID: <878se1uulb.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org, "K. Y.
 Srinivasan" <kys@microsoft.com>, Dan Williams <dan.j.williams@intel.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Baolu Lu <baolu.lu@intel.com>, Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Jacob Pan <jacob.jun.pan@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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

On Wed, Aug 26 2020 at 09:50, Megha Dey wrote:
>> @@ -329,15 +329,15 @@ static struct irq_chip dmar_msi_controll
>>   static irq_hw_number_t dmar_msi_get_hwirq(struct msi_domain_info *info,
>>   					  msi_alloc_info_t *arg)
>>   {
>> -	return arg->dmar_id;
>> +	return arg->hwirq;
>
> Shouldn't this return the arg->devid which gets set in dmar_alloc_hwirq?

Indeed.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
