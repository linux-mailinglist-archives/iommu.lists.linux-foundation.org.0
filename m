Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 427382B0765
	for <lists.iommu@lfdr.de>; Thu, 12 Nov 2020 15:15:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A481887141;
	Thu, 12 Nov 2020 14:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFjPSBKszxKb; Thu, 12 Nov 2020 14:15:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 282298713F;
	Thu, 12 Nov 2020 14:15:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F24C6C016F;
	Thu, 12 Nov 2020 14:15:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C3F4C016F
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 14:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DEAF02E1F8
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 14:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-auY1cM2MGX for <iommu@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 14:15:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id C116C2E1CF
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 14:15:24 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1605190521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JDqpKAUrItpHlbE5XWwW32ZAnSVkMvadrlti6qz8qYg=;
 b=VoYtF8BI7RLcnvT3P0hzVSJo32ng+9NyUF+JXWg9Pn+C/ZBbgYLROeCmx7sFdyFUT46rJ8
 CMgvz9C2LahmdePRNxCLbS0p64AoaEaNgwcwXHWd1keRONGI8MFHJ3BTtaKmpHo4I0TWZ2
 vAwHFQ7z9N2nz7aWk4kT7ClUADpdz1eCBBAilOODAeqO0AZvlmYSQAnqlKbuHY09FRhMD2
 leUg6Jii4k/Ama8r+Y8t9/x03N3KxlA/ZHF/uovVa8YZaKOZmppCgQROOI9hCdwFYpcd5N
 /gbLBb+JfH8XDmNEGF6gpfuInPulOkmBNtKHQDfQhVyp4CGcjfioiM8ZPO62Vw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1605190521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JDqpKAUrItpHlbE5XWwW32ZAnSVkMvadrlti6qz8qYg=;
 b=rHy7YOjnh3ZoFKx73oTAYHW5ZZpTYL59dAo5H0GGx5XK+D91l/tZPlDTpXltpPSMTfhgqa
 5GykZaJPuBPhNnCQ==
To: Jason Gunthorpe <jgg@nvidia.com>, Ziyad Atiyyeh <ziyadat@nvidia.com>,
 Itay Aveksis <itayav@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>
Subject: Re: REGRESSION: Re: [patch V2 00/46] x86, PCI, XEN,
 genirq ...: Prepare for device MSI
In-Reply-To: <20201112125531.GA873287@nvidia.com>
References: <20200826111628.794979401@linutronix.de>
 <20201112125531.GA873287@nvidia.com>
Date: Thu, 12 Nov 2020 15:15:21 +0100
Message-ID: <87mtzmmzk6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 David Woodhouse <dwmw2@infradead.org>
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

SmFzb24sCgoodHJpbW1lZCBDQyBsaXN0IGEgYml0KQoKT24gVGh1LCBOb3YgMTIgMjAyMCBhdCAw
ODo1NSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDI2LCAyMDIwIGF0IDAx
OjE2OjI4UE0gKzAyMDAsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBUaGV5IHdlcmUgdW5hYmxl
IHRvIGJpc2VjdCBmdXJ0aGVyIGludG8gdGhlIHNlcmllcyBiZWNhdXNlIHNvbWUgb2YgdGhlCj4g
aW50ZXJpb3IgY29tbWl0cyBkb24ndCBib290IDooCj4KPiBXaGVuIHdlIHRyeSB0byBsb2FkIHRo
ZSBtbHg1IGRyaXZlciBvbiBhIGJhcmUgbWV0YWwgVkYgaXQgZ2V0cyB0aGlzOgo+Cj4gW1RodSBP
Y3QgMjIgMDg6NTQ6NTEgMjAyMF0gRE1BUjogRFJIRDogaGFuZGxpbmcgZmF1bHQgc3RhdHVzIHJl
ZyAyCj4gW1RodSBPY3QgMjIgMDg6NTQ6NTEgMjAyMF0gRE1BUjogW0lOVFItUkVNQVBdIFJlcXVl
c3QgZGV2aWNlIFs0MjowMC4yXSBmYXVsdCBpbmRleCAxNjAwIFtmYXVsdCByZWFzb24gMzddIEJs
b2NrZWQgYSBjb21wYXRpYmlsaXR5IGZvcm1hdCBpbnRlcnJ1cHQgcmVxdWVzdAo+IFtUaHUgT2N0
IDIyIDA4OjU1OjA0IDIwMjBdIG1seDVfY29yZSAwMDAwOjQyOjAwLjEgZXRoNDogTGluayBkb3du
Cj4gW1RodSBPY3QgMjIgMDg6NTU6MTEgMjAyMF0gbWx4NV9jb3JlIDAwMDA6NDI6MDAuMSBldGg0
OiBMaW5rIHVwCj4gW1RodSBPY3QgMjIgMDg6NTU6NTQgMjAyMF0gbWx4NV9jb3JlIDAwMDA6NDI6
MDAuMjogbWx4NV9jbWRfZXFfcmVjb3ZlcjoyNjQ6KHBpZCAzMzkwKTogUmVjb3ZlcmVkIDEgRVFF
cyBvbiBjbWRfZXEKPiBbVGh1IE9jdCAyMiAwODo1NTo1NCAyMDIwXSBtbHg1X2NvcmUgMDAwMDo0
MjowMC4yOiB3YWl0X2Z1bmNfaGFuZGxlX2V4ZWNfdGltZW91dDoxMDUxOihwaWQgMzM5MCk6IGNt
ZDA6IENSRUFURV9FUSgww4PClzMwMSkgcmVjb3ZlcmVkIGFmdGVyIHRpbWVvdXQKPiBbVGh1IE9j
dCAyMiAwODo1NTo1NCAyMDIwXSBETUFSOiBEUkhEOiBoYW5kbGluZyBmYXVsdCBzdGF0dXMgcmVn
IDEwMgo+IFtUaHUgT2N0IDIyIDA4OjU1OjU0IDIwMjBdIERNQVI6IFtJTlRSLVJFTUFQXSBSZXF1
ZXN0IGRldmljZSBbNDI6MDAuMl0gZmF1bHQgaW5kZXggMTYwMCBbZmF1bHQgcmVhc29uIDM3XSBC
bG9ja2VkIGEgY29tcGF0aWJpbGl0eSBmb3JtYXQgaW50ZXJydXB0IHJlcXVlc3QKPgo+IElmIHlv
dSBoYXZlIGFueSBpZGVhIFppeWFkIGFuZCBJdGF5IGNhbiBydW4gYW55IGRlYnVnZ2luZyB5b3Ug
bGlrZS4KPgo+IEkgc3VwcG9zZSBpdCBpcyBiZWNhdXNlIHRoaXMgc2VyaWVzIGlzIGhhbmRpbmcg
b3V0IGNvbXBhdGFiaWxpdHkKPiBhZGRyL2RhdGEgcGFpcnMgd2hpbGUgdGhlIElPTU1VIGlzIHNl
dHVwIHRvIG9ubHkgYWNjZXB0IHJlbWFwIG9uZXMKPiBmcm9tIFNSSU9WIFZGcz8KClNvIHRoZSBp
c3N1ZSBzZWVtcyB0byBiZSB0aGF0IHRoZSBWRiBkZXZpY2UgaGFzIHRoZSBkZWZhdWx0IGlycSBk
b21haW4KYXNzaWduZWQgYW5kIG5vdCB0aGUgcmVtYXBwaW5nIGRvbWFpbi4gTGV0IG1lIHN0YXJl
IGludG8gdGhlIGNvZGUgdG8gc2VlCmhvdyB0aGVzZSBWRiBkZXZpY2VzIGFyZSBzZXQgdXAgYW5k
IHJlZ2lzdGVyZWQgd2l0aCB0aGUgSU9NTVUvcmVtYXAKdW5pdC4KClRoYW5rcywKCiAgICAgICAg
dGdseAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9t
bXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
