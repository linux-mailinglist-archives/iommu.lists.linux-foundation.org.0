Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 157082515B9
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 11:52:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BEAAF8820F;
	Tue, 25 Aug 2020 09:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEutLtM0O8Hv; Tue, 25 Aug 2020 09:52:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 525AC87A34;
	Tue, 25 Aug 2020 09:52:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37B31C0891;
	Tue, 25 Aug 2020 09:52:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81E76C0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 09:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 75C1C87A34
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 09:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DftEudfzNALI for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 09:52:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E497A85C12
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 09:52:01 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598349119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qi88rJ2mAeMyhee0eT9kDZfffU9Q0nWkBLlAEntSw8w=;
 b=saPe2SMHs4fxaHPtIfmZINCVtmade/IUdScDTrTE56bKhbWhWWPmlrhyuwQwbPnFdv02n1
 qRKHY6+Fao2onQFOAz/d63P6+2VnSYMbUC+pcft0s0SMwT2vV9us/1npGja2X+2tYSpscB
 iPJsYuS2FMf/1nMuwC8vtsuYf/y0bjbBwKrk2/0oTU5egQm1Ek/7EUMyQDShnlbtAcdbLe
 JE09lOMIrym7gVQeJa9rILtA3RsQfKKlIKniu0Z45R81ceeja+uMDPulnSnTEjTA49o3W7
 SMaqJJyWq0AnhRrTNSiWKeKyPcK0S21cZa7G3cB+Y0b9eRpBKdLEAoz+GdDGSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598349119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qi88rJ2mAeMyhee0eT9kDZfffU9Q0nWkBLlAEntSw8w=;
 b=OlmbOjhDdhkNmF8xd3M7JINOojGOBGj4UhpScwvT1dHOdNPkfP2dB8Acep6NLHMEEgMoKl
 YoToi1lJLBSp6rDQ==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [patch RFC 24/38] x86/xen: Consolidate XEN-MSI init
In-Reply-To: <fb4e3d13-18c8-a425-19a8-975fda80d411@suse.com>
References: <20200821002424.119492231@linutronix.de>
 <20200821002947.667887608@linutronix.de>
 <5caec213-8f56-9f12-34db-a29de8326f95@suse.com>
 <87tuwr68q8.fsf@nanos.tec.linutronix.de>
 <fb4e3d13-18c8-a425-19a8-975fda80d411@suse.com>
Date: Tue, 25 Aug 2020 11:51:58 +0200
Message-ID: <87d03f59z5.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org, "K. Y.
 Srinivasan" <kys@microsoft.com>, Dan Williams <dan.j.williams@intel.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Baolu Lu <baolu.lu@intel.com>, Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Russ Anderson <rja@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gVHVlLCBBdWcgMjUgMjAyMCBhdCAwNjoyMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAy
NC4wOC4yMCAyMzoyMSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+PiBJIHN0aWxsIHRoaW5rIGl0
IGRvZXMgdGhlIHJpZ2h0IHRoaW5nIGRlcGVuZGluZyBvbiB0aGUgcGxhY2UgaXQgaXMKPj4gY2Fs
bGVkIGZyb20sIGJ1dCBldmVuIGlmIHNvLCBpdCdzIGNvbXBsZXRlbHkgdW5yZWFkYWJsZSBndW5r
LiBJJ2xsIGZpeAo+PiB0aGF0IHByb3Blci4KPgo+IFRoZSBtYWluIGlzc3VlIGlzIHRoYXQgeGVu
X2luaXRpYWxfZG9tYWluKCkgYW5kIHhlbl9wdl9kb21haW4oKSBhcmUKPiBvcnRob2dvbmFsIHRv
IGVhY2ggb3RoZXIuIFNvIHhlbl9pbml0aWFsX2RvbWFpbigpIGNhbiBlaXRoZXIgYmUgdHJ1ZQo+
IGZvciB4ZW5fcHZfZG9tYWluKCkgKHRoZSAiY2xhc3NpYyIgcHYgZG9tMCkgb3IgZm9yIHhlbl9o
dm1fZG9tYWluKCkKPiAodGhlIG5ldyBQVkggZG9tMCkuCgpGYWlyIGVub3VnaC4gTXkgbGltaXRl
ZCBYRU5vbG9neSBzdHJpa2VkIGFnYWluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vaW9tbXU=
