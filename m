Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE5104C94
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 08:29:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE2BE86E6A;
	Thu, 21 Nov 2019 07:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAnKMwTodkAz; Thu, 21 Nov 2019 07:29:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B31B87C5C;
	Thu, 21 Nov 2019 07:29:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E770CC18DA;
	Thu, 21 Nov 2019 07:29:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69049C18DA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 07:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 52FB3886EE
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 07:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTRPfzbn61Xd for <iommu@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 07:29:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 097E8886E8
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 07:29:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 517D368B05; Thu, 21 Nov 2019 08:29:43 +0100 (CET)
Date: Thu, 21 Nov 2019 08:29:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI
 board installed, unless RAM size limited to 3500M
Message-ID: <20191121072943.GA24024@lst.de>
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net,
 mad skateman <madskateman@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 paulus@samba.org, rtd2@xtra.co.nz, "contact@a-eon.com" <contact@a-eon.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 nsaenzjulienne@suse.de
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

T24gU2F0LCBOb3YgMTYsIDIwMTkgYXQgMDg6MDY6MDVBTSArMDEwMCwgQ2hyaXN0aWFuIFppZ290
emt5IHdyb3RlOgo+IC8qCj4gICogIERNQSBhZGRyZXNzaW5nIG1vZGUuCj4gICoKPiAgKiAgMCA6
IDMyIGJpdCBhZGRyZXNzaW5nIGZvciBhbGwgY2hpcHMuCj4gICogIDEgOiA0MCBiaXQgYWRkcmVz
c2luZyB3aGVuIHN1cHBvcnRlZCBieSBjaGlwLgo+ICAqICAyIDogNjQgYml0IGFkZHJlc3Npbmcg
d2hlbiBzdXBwb3J0ZWQgYnkgY2hpcCwKPiAgKiAgICAgIGxpbWl0ZWQgdG8gMTYgc2VnbWVudHMg
b2YgNCBHQiAtPiA2NCBHQiBtYXguCj4gICovCj4gI2RlZmluZSAgIFNZTV9DT05GX0RNQV9BRERS
RVNTSU5HX01PREUgQ09ORklHX1NDU0lfU1lNNTNDOFhYX0RNQV9BRERSRVNTSU5HX01PREUKPiAK
PiBDeXJ1cyBjb25maWc6Cj4gCj4gQ09ORklHX1NDU0lfU1lNNTNDOFhYX0RNQV9BRERSRVNTSU5H
X01PREU9MQo+IAo+IEkgd2lsbCBjb25maWd1cmUg4oCcMCA6IDMyIGJpdCBhZGRyZXNzaW5nIGZv
ciBhbGwgY2hpcHPigJ0gZm9yIHRoZSBSQzguIE1heWJlIHRoaXMgaXMgdGhlIHNvbHV0aW9uLgoK
MCBtZWFucyB5b3UgYXJlIGdvaW5nIHRvIGRvIGJvdW5jZSBidWZmZXJpbmcgYSBsb3QsIHdoaWNo
IHNlZW1zCmdlbmVyYWxseSBsaWtlIGEgYmFkIGlkZWEuCgpCdXQgd2h5IGFyZSB3ZSB0YWxraW5n
IGFib3V0IHRoZSBzeW01M2M4eHggZHJpdmVyIG5vdz8gIFRoZSBsYXN0IGlzc3VlCnlvdSByZXBv
cnRlZCB3YXMgYWJvdXQgdmlkZW80bGludXggYWxsb2NhdGlvbnMuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
