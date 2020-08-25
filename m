Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A952E2513B1
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 09:57:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9C7882271C;
	Tue, 25 Aug 2020 07:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awIwjl51HZnA; Tue, 25 Aug 2020 07:57:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2A56C22718;
	Tue, 25 Aug 2020 07:57:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03031C016F;
	Tue, 25 Aug 2020 07:57:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 360DCC016F
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 07:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 316A08815E
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 07:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzQuOszT0Qmr for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 07:57:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DF323873DA
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 07:57:47 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598342264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7XEOONAx/Y/ZiGBa138zNdJ2aL0ZkJolLF35mYWdkk=;
 b=JIpR4o0QGi7kK727LCmqEP1DulpXQaBIgflkZBLs5t7Lz8BkKPnpuEKumBjEIUv4Qu2fG/
 Oir+lSuIqPfxIOiBFQCY78M6YxK5B+THOxc0icLjtAE5JJUVAEoLFxVLAg3uxDsMB1SGXX
 XnaeD4Z6L/kPkUhTl+94PS6Ks0d2HjckxWbTB9b++Lqlou5zbvd+xX/Hopw1vkn5tYovdo
 HLgyn2z6ttiQeTALU45iDOFAu5axIGbm6lbmj8cbkv/CZonC9AGBAL/usvMWV2QkosoUW5
 3RNUmC/gOSqY1Bc8xh5ArbnCykaJkYqCjP/+V1YJalXwg1JSBYvSGRteI38PbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598342264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7XEOONAx/Y/ZiGBa138zNdJ2aL0ZkJolLF35mYWdkk=;
 b=UFHNoPg/zXQ+Xg2Pv56inRA93Orb7eMVMpZPw2ESh1dxXdBikqTGQn7J7IK19znmQQ8GAl
 YbijH/OnOMKVGqAA==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [patch RFC 26/38] x86/xen: Wrap XEN MSI management into irqdomain
In-Reply-To: <8860c7bc-67ab-ce64-0340-1458d2483a39@suse.com>
References: <20200821002424.119492231@linutronix.de>
 <20200821002947.868727656@linutronix.de>
 <8860c7bc-67ab-ce64-0340-1458d2483a39@suse.com>
Date: Tue, 25 Aug 2020 09:57:44 +0200
Message-ID: <87r1rv5f9j.fsf@nanos.tec.linutronix.de>
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

T24gTW9uLCBBdWcgMjQgMjAyMCBhdCAwODoyMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAy
MS4wOC4yMCAwMjoyNCwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+Cj4gTG9va2luZyBpbnRvIGh0
dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vSVJRLWRvbWFpbi50eHQgKGlz
Cj4gdGhpcyBzdGlsbCB2YWxpZD8pCgpJdCdzIGhhbGZ3YXlzIGNvcnJlY3QuIEVtcGhhc2lzIG9u
IGhhbGZ3YXlzLgoKPiBJIGJlbGlldmUgWGVuIHNob3VsZCBiZSBhYmxlIHRvIHVzZSB0aGUgIk5v
IE1hcCIgYXBwcm9hY2gsIGFzIFhlbiBvbmx5Cj4gZXZlciB1c2VzIHNvZnR3YXJlIElSUXMgKGF0
IGxlYXN0IHRob3NlIGFyZSB0aGUgb25seSBvbmVzIHZpc2libGUgdG8KPiBhbnkgZHJpdmVyKS4g
VGhlICh2aXJ0dWFsaXplZCkgaGFyZHdhcmUgaW50ZXJydXB0cyBhcmUgWGVuIGV2ZW50cwo+IGFm
dGVyIGFsbC4KPgo+IFNvIG1heWJlIG1vcnBoaW5nIFhlbiBpbnRvIHN1cHBvcnRpbmcgaXJxZG9t
YWlucyBpbiBhIHNhbmUgd2F5IGlzbid0Cj4gdGhhdCBjb21wbGljYXRlZC4gTWF5YmUgSSdtIG1p
c3NpbmcgdGhlIG1haW4gY29tcGxleGl0aWVzLCB0aG91Z2guCgpUaGUgd3JhcHBlciBkb21haW4g
SSBkaWQgaXMgcHJldHR5IG11Y2ggdGhhdCwgYnV0IHdpdGggdGhlIGV4dHJhCmZ1bmN0aW9uYWxp
dHkgcmVxdWlyZWQgYnkgaGllcmFyY2hpY2FsIGlycSBkb21haW5zLiBTbywgeWVzIGl0J3MKZnVu
Y3Rpb25hbGx5IGNvcnJlY3QsIGJ1dCBpdCdzIG9ubHkgdXRpbGl6aW5nIHRoZSBhbGxvYy9mcmVl
IGludGVyZmFjZQphbmQgbm90IGFueSBvZiB0aGUgb3RoZXIgbWVjaGFuaXNtcyBwcm92aWRlZCBi
eSBpcnFkb21haW5zLiBUaGUgbGF0dGVyCnNob3VsZCBtYWtlIHRoZSBvdmVyYWxsIGNvZGUgc2lt
cGxlciBidXQgdGhhdCBvYnZpb3VzbHkgbmVlZHMgc29tZQp0aG91Z2h0LgoKVGhhbmtzLAoKICAg
ICAgICB0Z2x4CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
