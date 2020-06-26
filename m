Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EF220BD48
	for <lists.iommu@lfdr.de>; Sat, 27 Jun 2020 01:57:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 689E985EC4;
	Fri, 26 Jun 2020 23:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6p2sW5DADluQ; Fri, 26 Jun 2020 23:57:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5AB6485F60;
	Fri, 26 Jun 2020 23:57:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F4CAC016F;
	Fri, 26 Jun 2020 23:57:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4B78C016F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 23:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9663F86D33
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 23:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ah3ZfnHTBXFb for <iommu@lists.linux-foundation.org>;
 Fri, 26 Jun 2020 23:26:43 +0000 (UTC)
X-Greylist: delayed 00:26:00 by SQLgrey-1.7.6
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 30F8086D2E
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 23:26:43 +0000 (UTC)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1joxKW-0000PS-RM; Sat, 27 Jun 2020 01:00:20 +0200
Received: from [178.196.57.75] (helo=pc-9.home)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1joxKW-000HDo-F1; Sat, 27 Jun 2020 01:00:20 +0200
Subject: Re: [PATCH net] xsk: remove cheap_dma optimization
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 netdev@vger.kernel.org
References: <20200626134358.90122-1-bjorn.topel@gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <c60dfb5a-2bf3-20bd-74b3-6b5e215f73f8@iogearbox.net>
Date: Sat, 27 Jun 2020 01:00:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200626134358.90122-1-bjorn.topel@gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.3/25855/Fri Jun 26 15:19:25 2020)
X-Mailman-Approved-At: Fri, 26 Jun 2020 23:57:22 +0000
Cc: maximmi@mellanox.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 davem@davemloft.net, iommu@lists.linux-foundation.org,
 jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, hch@lst.de,
 magnus.karlsson@intel.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gNi8yNi8yMCAzOjQzIFBNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEZyb206IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuLnRvcGVsQGludGVsLmNvbT4KPiAKPiBXaGVuIHRoZSBBRl9YRFAgYnVmZmVy
IGFsbG9jYXRpb24gQVBJIHdhcyBpbnRyb2R1Y2VkIGl0IGhhZCBhbgo+IG9wdGltaXphdGlvbiwg
ImNoZWFwX2RtYSIuIFRoZSBpZGVhIHdhcyB0aGF0IHdoZW4gdGhlIHVtZW0gd2FzIERNQQo+IG1h
cHBlZCwgdGhlIHBvb2wgYWxzbyBjaGVja2VkIHdoZXRoZXIgdGhlIG1hcHBpbmcgcmVxdWlyZWQg
YQo+IHN5bmNocm9uaXphdGlvbiAoQ1BVIHRvIGRldmljZSwgYW5kIHZpY2UgdmVyc2EpLiBJZiBu
b3QsIGl0IHdvdWxkIGJlCj4gbWFya2VkIGFzICJjaGVhcF9kbWEiIGFuZCB0aGUgc3luY2hyb25p
emF0aW9uIHdvdWxkIGJlIGVsaWRlZC4KPiAKPiBJbiBbMV0gQ2hyaXN0b3BoIHBvaW50cyBvdXQg
dGhhdCB0aGUgb3B0aW1pemF0aW9uIGFib3ZlIGJyZWFrcyB0aGUgRE1BCj4gQVBJIGFic3RyYWN0
aW9uLCBhbmQgc2hvdWxkIGJlIHJlbW92ZWQuIEZ1cnRoZXIsIENocmlzdG9waCBwb2ludHMgb3V0
Cj4gdGhhdCBvcHRpbWl6YXRpb25zIGxpa2UgdGhpcyBzaG91bGQgYmUgZG9uZSB3aXRoaW4gdGhl
IERNQSBtYXBwaW5nCj4gY29yZSwgYW5kIG5vdCBlbHNld2hlcmUuCj4gCj4gVW5mb3J0dW5hdGVs
eSB0aGlzIGhhcyBpbXBsaWNhdGlvbnMgZm9yIHRoZSBwYWNrZXQgcmF0ZQo+IHBlcmZvcm1hbmNl
LiBUaGUgQUZfWERQIHJ4ZHJvcCBzY2VuYXJpbyBzaG93cyBhIDklIGRlY3JlYXNlIGluIHBhY2tl
dHMKPiBwZXIgc2Vjb25kLgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYv
MjAyMDA2MjYwNzQ3MjUuR0EyMTc5MEBsc3QuZGUvCj4gCj4gQ2M6IENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPgo+IEZpeGVzOiAyYjQzNDcwYWRkOGMgKCJ4c2s6IEludHJvZHVjZSBBRl9Y
RFAgYnVmZmVyIGFsbG9jYXRpb24gQVBJIikKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybi50b3BlbEBpbnRlbC5jb20+CgpHaXZlbiB0aGVyZSBpcyByb3VnaGx5IGEgfjUgd2Vl
a3Mgd2luZG93IGF0IG1heCB3aGVyZSB0aGlzIHJlbW92YWwgY291bGQKc3RpbGwgYmUgYXBwbGll
ZCBpbiB0aGUgd29yc3QgY2FzZSwgY291bGQgd2UgY29tZSB1cCB3aXRoIGEgZml4IC8gcHJvcG9z
YWwKZmlyc3QgdGhhdCBtb3ZlcyB0aGlzIGludG8gdGhlIERNQSBtYXBwaW5nIGNvcmU/IElmIHRo
ZXJlIGlzIHNvbWV0aGluZyB0aGF0CmNhbiBiZSBhZ3JlZWQgdXBvbiBieSBhbGwgcGFydGllcywg
dGhlbiB3ZSBjb3VsZCBhdm9pZCByZS1hZGRpbmcgdGhlIDklCnNsb3dkb3duLiA6LwoKVGhhbmtz
LApEYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
