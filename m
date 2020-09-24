Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 67185277984
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 21:39:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0ED7320494;
	Thu, 24 Sep 2020 19:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YG8grdFh7mgC; Thu, 24 Sep 2020 19:39:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 899CB203AE;
	Thu, 24 Sep 2020 19:39:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EA9BC0051;
	Thu, 24 Sep 2020 19:39:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66E92C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 19:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 55F99869B8
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 19:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzcOVe1As7Yg for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 19:39:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5634386975
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 19:39:48 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600976386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKmZ6Hme7DnOHdUpQ1SomZU9CqIevpDX1eeZyPMseV0=;
 b=IEL5X+LK6JhMgaIfhWEcKQxyJKHMXnm6zIEwrB43R8MKyC2V7wSaoHSPb1A0kAVJnI6PVo
 6cygew6SdE6qg+AcyUmHMgjyvD8/oLUscHZitOFXswa1v8intEQ6sz3plNxvekzZLaEV3/
 c1/JlVYBiNN9yq97ZLFMm6UZaDAD+Dw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-c9vaSAc9NBaFhhv0K2UHOw-1; Thu, 24 Sep 2020 15:39:42 -0400
X-MC-Unique: c9vaSAc9NBaFhhv0K2UHOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36B6AAD501;
 Thu, 24 Sep 2020 19:39:40 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C61B53782;
 Thu, 24 Sep 2020 19:39:38 +0000 (UTC)
Date: Thu, 24 Sep 2020 13:39:38 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [bugzilla-daemon@bugzilla.kernel.org: [Bug 209149] New:
 "iommu/vt-d: Enable PCI ACS for platform opt in hint" makes NVMe config
 space not accessible after S3]
Message-ID: <20200924133938.6b93732f@x1.home>
In-Reply-To: <20200924180905.GB85236@otc-nc-03>
References: <20200923160327.GA2267374@bjorn-Precision-5520>
 <6CD003F6-DDF4-4C57-AD9E-79C8AB5C01BF@canonical.com>
 <20200924180905.GB85236@otc-nc-03>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Joerg Roedel <jroedel@suse.de>, "Jechlitschek,
 Christoph" <christoph.jechlitschek@intel.com>,
 Sagi Grimberg <sagi@grimberg.me>, "open
 list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, "open list:NVM EXPRESS
 DRIVER" <linux-nvme@lists.infradead.org>, Jens Axboe <axboe@fb.com>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 iommu@lists.linux-foundation.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Rajat Jain <rajatja@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>
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

On Thu, 24 Sep 2020 11:09:05 -0700
"Raj, Ashok" <ashok.raj@intel.com> wrote:

> Hi Kai
> 
> + Alex, since he had some of the early quirks authored.
> 
> On Thu, Sep 24, 2020 at 12:31:53AM +0800, Kai-Heng Feng wrote:
> > [+Cc Christoph]
> >   
> > > On Sep 24, 2020, at 00:03, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > 
> > > [+cc IOMMU and NVMe folks]
> > > 
> > > Sorry, I forgot to forward this to linux-pci when it was first
> > > reported.
> > > 
> > > Apparently this happens with v5.9-rc3, and may be related to
> > > 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint"),
> > > which appeared in v5.8-rc3.
> > > 
> > > There are several dmesg logs and proposed patches in the bugzilla, but
> > > no analysis yet of what the problem is.  From the first dmesg
> > > attachment (https://bugzilla.kernel.org/attachment.cgi?id=292327):  
> > 
> > AFAIK Intel is working on it internally.
> > Comet Lake probably needs ACS quirk like older generation chips.  
> 
> I have confirmed with Internal documentation that the problem exists on
> Comet Lake. But its fixed ICL and TGL generations.
> 
> Unfortunately I do not see if the public specupdate documents are for these
> generation chipsets to makes sure all root port id's can be captured.
> 
> There is also another entry in bugzilla that was forwarded that referred to
> Request Redirect Capability to be always disabled as well. This same
> workaround also seems to be turning off RR for the root port. I believe it
> should fix it as well. But i saw another patch attached.
> 
> Can you tell how you reproduce this? just doing a
> 
> #echo mem > /sys/power/state
> 
> is sufficient with an attached NVMe drive? 
> 
> >   
> > > 
> > >  [   50.434945] PM: suspend entry (deep)
> > >  [   50.802086] nvme 0000:01:00.0: saving config space at offset 0x0 (reading 0x11e0f)
> > >  [   50.842775] ACPI: Preparing to enter system sleep state S3
> > >  [   50.858922] ACPI: Waking up from system sleep state S3
> > >  [   50.883622] nvme 0000:01:00.0: can't change power state from D3hot to D0 (config space inaccessible)
> > >  [   50.947352] nvme 0000:01:00.0: restoring config space at offset 0x0 (was 0xffffffff, writing 0x11e0f)
> > >  [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
> > >  [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> > >  [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> > >  [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
> > >  [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> > >  [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> > >  [   50.947843] nvme nvme0: frozen state error detected, reset controller
> > > 
> > > I suspect the nvme "can't change power state" and restore config space
> > > errors are a consequence of the DPC event.  If DPC disables the link,
> > > the device is inaccessible.
> > > 
> > > I don't know what caused the ACS Violation.  The AER TLP Header Log
> > > might have a clue, but unfortunately we didn't print it.
> > >   
> 
> Apparently it also requires to disable RR, and I'm not able to confirm if
> CML requires that as well. 
> 
> pci_quirk_disable_intel_spt_pch_acs_redir() also seems to consult the same
> table, so i'm not sure why we need the other patch in bugzilla is required.

If we're talking about the Intel bug where PCH root ports implement
the ACS capability and control registers as dword rather than word
registers, then how is ACS getting enabled in order to generate an ACS
violation?  The standard ACS code would write to the control register
word at offset 6, which is still the read-only capability register on
those devices.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
