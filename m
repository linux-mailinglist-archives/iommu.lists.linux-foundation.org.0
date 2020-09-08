Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF1261206
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 15:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E0AD52288E;
	Tue,  8 Sep 2020 13:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzH9VJMiYf7F; Tue,  8 Sep 2020 13:35:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C5CB20436;
	Tue,  8 Sep 2020 13:35:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BB48C0051;
	Tue,  8 Sep 2020 13:35:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00A08C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 13:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DE14486964
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 13:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c740AWRAQhPB for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 13:35:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 22D3B869D5
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 13:35:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y15so4578605wmi.0
 for <iommu@lists.linux-foundation.org>; Tue, 08 Sep 2020 06:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L+q7scp9xjjgch+ap+Le4uzp4lwNvS0O3pZwHfl5AC4=;
 b=Zda6lGduYQJwSt8t764js3peWxBmEh6nm5T2tU73wqtWI2tBLARbhRucqJ03cGYbSV
 kLWbZp2cAknIthFCVuTXdBiDpFAvSr1ey3QAnZDlsv844BW+/5IJVQOeDTjIUHLILTry
 2C+GobTKt1C/k7vOPmy0Q2ZgzcqBcM4YaDL3x0JUUd0CAGXbWBN/s+A7pmFqUBn9Nazr
 eygWSu0eQFXEJGNTUs5LjEXBO/pYVs93o+nIGZFsgX6KQ/iaJJsoNOj57xrvmh0qdo58
 g2v52GCAWHyeS7OBaC3wmCjV3GJ192Rqthj+zFRbWNwMA9qV+fWf2fCjpnQbGEKYgq85
 qFCQ==
X-Gm-Message-State: AOAM530cCc3bPeMHGIWrjYk81nKXwRzXEmkrHlISQ+oJrczDhenZi79J
 sV1p8p5vIIgjI+nzgIj2X2Y=
X-Google-Smtp-Source: ABdhPJzYi9ehfaPBVSXymEhhuH1GTRlLQTD8B0hsU4d7EUccdQ6mwISG5Qg1ixAsK4hgy2OnnuC5uw==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr4463133wmk.86.1599572119661; 
 Tue, 08 Sep 2020 06:35:19 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p18sm14414596wrx.47.2020.09.08.06.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 06:35:18 -0700 (PDT)
Date: Tue, 8 Sep 2020 13:35:17 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 14/46] x86/ioapic: Consolidate IOAPIC allocation
Message-ID: <20200908133517.nrqweaycr2erqscd@liuwe-devbox-debian-v2>
References: <20200826111628.794979401@linutronix.de>
 <20200826112332.054367732@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826112332.054367732@linutronix.de>
User-Agent: NeoMutt/20180716
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
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

On Wed, Aug 26, 2020 at 01:16:42PM +0200, Thomas Gleixner wrote:
...
> --- a/drivers/iommu/hyperv-iommu.c
> +++ b/drivers/iommu/hyperv-iommu.c
> @@ -101,7 +101,7 @@ static int hyperv_irq_remapping_alloc(st
>  	 * in the chip_data and hyperv_irq_remapping_activate()/hyperv_ir_set_
>  	 * affinity() set vector and dest_apicid directly into IO-APIC entry.
>  	 */
> -	irq_data->chip_data = info->ioapic_entry;
> +	irq_data->chip_data = info->ioapic.entry;

Not sure if it is required for such a trivial change but here you go:

Acked-by: Wei Liu <wei.liu@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
