Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFF9153F39
	for <lists.iommu@lfdr.de>; Thu,  6 Feb 2020 08:26:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 113BA85CFE;
	Thu,  6 Feb 2020 07:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBwPgg316UB8; Thu,  6 Feb 2020 07:26:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A373B85CD8;
	Thu,  6 Feb 2020 07:26:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86F27C013E;
	Thu,  6 Feb 2020 07:26:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AA31C013E
 for <iommu@lists.linux-foundation.org>; Thu,  6 Feb 2020 07:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49794850BE
 for <iommu@lists.linux-foundation.org>; Thu,  6 Feb 2020 07:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NqIz3lg5nF9L for <iommu@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 07:26:33 +0000 (UTC)
X-Greylist: delayed 21:10:37 by SQLgrey-1.7.6
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 68C2984BAD
 for <iommu@lists.linux-foundation.org>; Thu,  6 Feb 2020 07:26:33 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id k188so3133316vsc.8
 for <iommu@lists.linux-foundation.org>; Wed, 05 Feb 2020 23:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JUSrIWljLZiQAdYA8OR3m0qEhDa+P7lRjn7Jwv/yp0Y=;
 b=BSNviLIYOKU0eA0Tol2ZMKGjOshfAFELQKFV+KP803wtoauvXzSB0+PlIuMkbtPN50
 usTsbanfLewc6VghkSyhzR/tFqKQsoT6XOkgRMui35y8YNCw2JJMaYjoi41QXdCE5fOM
 vElJo67AARovaRk/mv7JbBW98u0S2jhKdFtBrVkKUnOIwdVzpXHV7guAzrpMtwYqRZVi
 DUJPHpTYeCo/DO+g6nxcdbcNw2LzBEtRuXkyiHD7lyIQIr2wZXXdM1zdtz6HNzueWLXp
 JBwqaJaH4+1nSIH330ME9RGoOIXOd6SWJ5Bb2CmVulQRkdfVTbQsUEPWsUyWwbvgEBwo
 qZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JUSrIWljLZiQAdYA8OR3m0qEhDa+P7lRjn7Jwv/yp0Y=;
 b=Js2pkvqNOO4bQIvSmRcsRAv7+YQbspyygyxjdPnt977b80xkFPlxSqj0oumDTYvG3J
 CB0OU4KSGs29l1IyWAB5YBbmZdCUyc19smSjJ/PJbEHXq34kK/5utwRauan1nANxUFwR
 PzJdr2INjdPiKAPj7QdgRin61J7rAp40S/LTbwMUVSth5llfmhcj7+xXd0m6wK72CCT6
 C3LmLAgoBnmUXcywVzZlOgxWKZf/GKUraS9+p8148JBUYn17kc05OGnBvtpG37n/3GgT
 EOL+nNLbH3xlvTXwXs8vXOEL2aVjV9Z6oM6n81SpfJB3nmZ51kjRdW/1e2OI8L81vyWH
 EIcw==
X-Gm-Message-State: APjAAAWPhBxeb3siM37EDQIb1bO3ewlnq129hmoBuIp58igRHGPpsMF4
 XYZlZpWDPE750Fei8PifZpj5QfYpXWQjtt/GxuQwVwHq1vMLNQ==
X-Google-Smtp-Source: APXvYqx/KOmpudOiOHvSL6H90ncNLbKPHXv63QYZEEwWlX7f+TzDrjWmNZVib6m++dFVUs2k5FNy5t1yne56uoRwbXU=
X-Received: by 2002:a05:6102:18f:: with SMTP id
 r15mr888207vsq.206.1580973991857; 
 Wed, 05 Feb 2020 23:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20200203091009.196658-1-jian-hong@endlessm.com>
 <aab0948d-c6a3-baa1-7343-f18c936d662d@linux.intel.com>
 <CAPpJ_edkkWm0DYHB3U8nQPv=z_o-aV4V7RDMuLTXL5N1H6ZYrA@mail.gmail.com>
 <948da337-128f-22ae-7b2e-730b4b8da446@linux.intel.com>
 <CAPpJ_ecM0oCUjYLbG+uTprRk0=OTUBTxZc-d2BGBRDSYWk4uSQ@mail.gmail.com>
In-Reply-To: <CAPpJ_ecM0oCUjYLbG+uTprRk0=OTUBTxZc-d2BGBRDSYWk4uSQ@mail.gmail.com>
From: Jian-Hong Pan <jian-hong@endlessm.com>
Date: Thu, 6 Feb 2020 15:25:48 +0800
Message-ID: <CAPpJ_efn0jwHf8rWjBm0=BwrFd=z7MATWkNsqNfHuyrn4wAt+w@mail.gmail.com>
Subject: Re: [PATCH] iommu/intel-iommu: set as DUMMY_DEVICE_DOMAIN_INFO if no
 IOMMU
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Linux Upstreaming Team <linux@endlessm.com>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
 Linux Kernel <linux-kernel@vger.kernel.org>
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

Smlhbi1Ib25nIFBhbiA8amlhbi1ob25nQGVuZGxlc3NtLmNvbT4g5pa8IDIwMjDlubQy5pyINeaX
pSDpgLHkuIkg5LiL5Y2INjowNuWvq+mBk++8mgo+Cj4gTHUgQmFvbHUgPGJhb2x1Lmx1QGxpbnV4
LmludGVsLmNvbT4g5pa8IDIwMjDlubQy5pyINeaXpSDpgLHkuIkg5LiK5Y2IOToyOOWvq+mBk++8
mgo+ID4KPiA+IEhpLAo+ID4KPiA+IE9uIDIwMjAvMi80IDE3OjI1LCBKaWFuLUhvbmcgUGFuIHdy
b3RlOgo+ID4gPiBMdSBCYW9sdSA8YmFvbHUubHVAbGludXguaW50ZWwuY29tPiDmlrwgMjAyMOW5
tDLmnIg05pelIOmAseS6jCDkuIvljYgyOjEx5a+r6YGT77yaCj4gPiA+Pgo+ID4gPj4gSGksCj4g
PiA+Pgo+ID4gPj4gT24gMjAyMC8yLzMgMTc6MTAsIEppYW4tSG9uZyBQYW4gd3JvdGU6Cj4gPiA+
Pj4gSWYgdGhlIGRldmljZSBoYXMgbm8gSU9NTVUsIGl0IHN0aWxsIGludm9rZXMgaW9tbXVfbmVl
ZF9tYXBwaW5nIGR1cmluZwo+ID4gPj4+IGludGVsX2FsbG9jX2NvaGVyZW50LiBIb3dldmVyLCBp
b21tdV9uZWVkX21hcHBpbmcgY2FuIG9ubHkgY2hlY2sgdGhlCj4gPiA+Pj4gZGV2aWNlIGlzIERV
TU1ZX0RFVklDRV9ET01BSU5fSU5GTyBvciBub3QuIFRoaXMgcGF0Y2ggbWFya3MgdGhlIGRldmlj
ZQo+ID4gPj4+IGlzIGEgRFVNTVlfREVWSUNFX0RPTUFJTl9JTkZPIGlmIHRoZSBkZXZpY2UgaGFz
IG5vIElPTU1VLgo+ID4gPj4+Cj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogSmlhbi1Ib25nIFBhbiA8
amlhbi1ob25nQGVuZGxlc3NtLmNvbT4KPiA+ID4+PiAtLS0KPiA+ID4+PiAgICBkcml2ZXJzL2lv
bW11L2ludGVsLWlvbW11LmMgfCA0ICsrKy0KPiA+ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Pj4KPiA+ID4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jIGIvZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5j
Cj4gPiA+Pj4gaW5kZXggMzVhNGEzYWJlZGM2Li44NzhiYzk4NmEwMTUgMTAwNjQ0Cj4gPiA+Pj4g
LS0tIGEvZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jCj4gPiA+Pj4gKysrIGIvZHJpdmVycy9p
b21tdS9pbnRlbC1pb21tdS5jCj4gPiA+Pj4gQEAgLTU2MTIsOCArNTYxMiwxMCBAQCBzdGF0aWMg
aW50IGludGVsX2lvbW11X2FkZF9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gPj4+ICAg
ICAgICBpbnQgcmV0Owo+ID4gPj4+Cj4gPiA+Pj4gICAgICAgIGlvbW11ID0gZGV2aWNlX3RvX2lv
bW11KGRldiwgJmJ1cywgJmRldmZuKTsKPiA+ID4+PiAtICAgICBpZiAoIWlvbW11KQo+ID4gPj4+
ICsgICAgIGlmICghaW9tbXUpIHsKPiA+ID4+PiArICAgICAgICAgICAgIGRldi0+YXJjaGRhdGEu
aW9tbXUgPSBEVU1NWV9ERVZJQ0VfRE9NQUlOX0lORk87Cj4gPiA+Pgo+ID4gPj4gSXMgdGhpcyBh
IERNQSBjYXBhYmxlIGRldmljZT8KPiA+ID4KPiA+ID4gRG8geW91IG1lYW4gaXMgdGhlIGRldmlj
ZSBpbiBETUEgUmVtYXBwaW5nIHRhYmxlPwo+ID4gPiBEdW1wIERNQVIgZnJvbSBBQ1BJIHRhYmxl
LiAgVGhlIGRldmljZSBpcyBub3QgaW4gdGhlIHRhYmxlLgo+ID4gPiBTbywgaXQgZG9lcyBub3Qg
c3VwcG9ydCBETUFSLCBJbnRlbCBJT01NVS4KPiA+ID4KPiA+ID4gT3IsIHNob3VsZCBkZXZpY2Vf
dG9faW9tbXUgYmUgaW52b2tlZCBpbiBpb21tdV9uZWVkX21hcHBpbmcgdG8gY2hlY2sKPiA+ID4g
SU9NTVUgZmVhdHVyZSBhZ2Fpbj8KPiA+ID4KPiA+Cj4gPiBOb3JtYWxseSBpbnRlbF9pb21tdV9h
ZGRfZGV2aWNlKCkgc2hvdWxkIG9ubHkgYmUgY2FsbGVkIGZvciBQQ0kgZGV2aWNlcwo+ID4gYW5k
IEFQQ0kgbmFtZSBzcGFjZSBkZXZpY2VzIChyZXBvcnRlZCBpbiBBQ1BJL0RNQVIgdGFibGUpLiBJ
biBib3RoCj4gPiBjYXNlcywgZGV2aWNlX3RvX2lvbW11KCkgc2hvdWxkIGFsd2F5cyByZXR1cm4g
YSBjb3JyZXNwb25kaW5nIGlvbW11LiBJCj4gPiBqdXN0IHRyaWVkIHRvIHVuZGVyc3RhbmQgd2h5
IGl0IGZhaWxlZCBmb3IgeW91ciBjYXNlLgoKSGksCgpIZXJlIGlzIHRoZSBvcmlnaW5hbCBpc3N1
ZTogVGhlcmUgYXJlIG1vcmUgYW5kIG1vcmUgbGFwdG9wcyBlcXVpcHBlZAp3aXRoIEludGVsIFJh
cGlkIFN0b3JhZ2UgVGVjaG5vbG9neSAoUlNUKSBmZWF0dXJlLiAgVGhhdCBtYWtlcyB0aGUKTlZN
ZSBTU0QgaGlkZGVuIGFuZCBhcyB0aGUgY2FjaGUuICBIb3dldmVyLCB0aGVyZSBpcyBubyBidWls
dCBpbgpkcml2ZXIgZm9yIGl0LiAgU28sIERhbmllbCBwcmVwYXJlcyBhIGRyaXZlciBjYWxsZWQg
aW50ZWwtbnZtZS1yZW1hcApbMV0gdG8gcmVtYXAgYW5kIHNob3cgdXAgdGhlIGhpZGRlbiBOVk1l
IFNTRCBhbmQgbWFrZSBpdCBhcyBhIG5vcm1hbApTU0QuICBUaGUgZHJpdmVyIGlzIGRldmVsb3Bl
ZCBhbmQgcmVmZXJzIHRvCmRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvdm1kLmMuCgpSZWNlbnRseSwg
d2UgZ2V0IGEgbGFwdG9wIHdpdGggSW50ZWwgUlNUIGZlYXR1cmUgZW5hYmxlZCBpbiBCSU9TIGFu
ZAp0d28gTlZNZSBTU0RzIGFmdGVyIHRoZSBSQUlEIGJ1cyBjb250cm9sbGVyLiAgU28sIHRob3Nl
IHR3byBOVk1lIFNTRHMKYXJlIGhpZGRlbiBieSBJbnRlbCBSU1QuICBUaGVuLCBpbnRlbC1udm1l
LXJlbWFwIGlzIGdvaW5nIHRvIHJlbWFwIGFuZApzaG93IHVwIHRoZSBOVk1lIFNTRHMuICBCdXQg
aXQgaGl0cyB0d28gaXNzdWVzOgoKMS4gVGhlIGRhdGF0eXBlIG9mIHNlZ21lbnQgZm9yIFBDSSBp
biBpbnRlbC1pb21tdSBpcyB1MTYgWzJdLCBidXQKcGNpX2RvbWFpbl9ucigpIFszXVs0XSByZXR1
cm5zIGFuIGludGVnZXIuICBUaGF0IG1ha2VzIG92ZXJmbG93Cihwb3NzaWJsZSksIHRoZW4gdHJ1
bmNhdGVzIHNlZ21lbnQgdG8gYSB3cm9uZyBudW1iZXIuCjIuIFRoZSBkZXZpY2UgaGFzIG5vIElP
TU1VIGJ1dCBzdGlsbCBiZSBhc2tlZCB0byBkbyBJT01NVSBtYXBwaW5nIGZvcgppbnRlbF9hbGxv
Y19jb2hlcmVudCBpbiBpbnRlbC1pb21tdS4KCkl0ZW0gMToKICAgRm9yIGV4YW1wbGUsIFZNRCdz
IGRvbWFpbi9zZWdtZW50IG51bWJlciBzdGFydHMgZnJvbSAweDEwMDAwIFs1XS4KSW50ZWwtbnZt
ZS1yZW1hcCBpbXBsZW1lbnRzIHRoZSBzYW1lIGlkZWEgb3JpZ2luYWxseSBbNl0uICBCdXQgd2UK
Zm91bmQgc3lzdGVtIHNob3dzIEJVR19PTiBlcnJvciBpbiBkbWFyX2luc2VydF9kZXZfc2NvcGUo
KSBkdXJpbmcKcHJvYmluZyB0aGUgZGV2aWNlIGFuZCBub25lIG9mIHRoZSBOVk1lIFNTRCBpcyBz
aG93bi4KClsgICAgNy40MzMwNzldIGludGVsLW52bWUtcmVtYXAgMDAwMDowMDoxNy4wOiBGb3Vu
ZCAyIHJlbWFwcGVkIE5WTWUgZGV2aWNlcwpbICAgIDcuNDMzMTE2XSBpbnRlbC1udm1lLXJlbWFw
IDAwMDA6MDA6MTcuMDogUENJIGhvc3QgYnJpZGdlIHRvIGJ1cyAxMDAwMDowMApbICAgIDcuNDMz
MTE3XSBwY2lfYnVzIDEwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4YWUxMDgwMDAt
MHhhZTEwYmZmZl0KWyAgICA3LjQzMzExOF0gcGNpX2J1cyAxMDAwMDowMDogcm9vdCBidXMgcmVz
b3VyY2UgW21lbSAweGFlMTBjMDAwLTB4YWUxMGZmZmZdClsgICAgNy40MzMxMTldIHBjaV9idXMg
MTAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHhhZTFhMDAwMC0weGFlMWE3ZmZmXQpb
ICAgIDcuNDMzMTIwXSBwY2lfYnVzIDEwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4
YWUxYTgwMDAtMHhhZTFhODBmZl0KWyAgICA3LjQzMzEyMV0gcGNpX2J1cyAxMDAwMDowMDogcm9v
dCBidXMgcmVzb3VyY2UgW2lvICAweDMwOTAtMHgzMDk3XQpbICAgIDcuNDMzMTIxXSBwY2lfYnVz
IDEwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbaW8gIDB4MzA4MC0weDMwODNdClsgICAgNy40
MzMxMjJdIHBjaV9idXMgMTAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtpbyAgMHgzMDYwLTB4
MzA3Zl0KWyAgICA3LjQzMzEyM10gcGNpX2J1cyAxMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2Ug
W21lbSAweGFlMTAwMDAwLTB4YWUxN2ZmZmZdClsgICAgNy40MzMyNDFdIHBjaSAxMDAwMDowMDow
MC4wOiBbODA4NjowMmQ3XSB0eXBlIDAwIGNsYXNzIDB4MDEwNjAxClsgICAgNy40MzMyNzZdIHBj
aSAxMDAwMDowMDowMC4wOiByZWcgMHgxMDogW21lbSAweGFlMWEwMDAwLTB4YWUxYTdmZmZdClsg
ICAgNy40MzMyOTBdIHBjaSAxMDAwMDowMDowMC4wOiByZWcgMHgxNDogW21lbSAweGFlMWE4MDAw
LTB4YWUxYTgwZmZdClsgICAgNy40MzMzMDNdIHBjaSAxMDAwMDowMDowMC4wOiByZWcgMHgxODog
W2lvICAweDMwOTAtMHgzMDk3XQpbICAgIDcuNDMzMzE3XSBwY2kgMTAwMDA6MDA6MDAuMDogcmVn
IDB4MWM6IFtpbyAgMHgzMDgwLTB4MzA4M10KWyAgICA3LjQzMzMzMF0gcGNpIDEwMDAwOjAwOjAw
LjA6IHJlZyAweDIwOiBbaW8gIDB4MzA2MC0weDMwN2ZdClsgICAgNy40MzM0NDBdIHBjaSAxMDAw
MDowMDowMC4wOiByZWcgMHgyNDogW21lbSAweGFlMTAwMDAwLTB4YWUxMDNmZmZdClsgICAgNy40
MzM1MzZdIHBjaSAxMDAwMDowMDowMC4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQzaG90ClsgICAg
Ny40MzM4MzZdIHBjaSAxMDAwMDowMDowMC4wOiBGYWlsZWQgdG8gYWRkIHRvIGlvbW11IGdyb3Vw
IDEzOiAtMTYKWyAgICA3LjQzMzg2MF0gcGNpIDEwMDAwOjAwOjAxLjA6IFs4MDg2OjAwMDBdIHR5
cGUgMDAgY2xhc3MgMHgwMTA4MDIKWyAgICA3LjQzMzg2M10gcGNpIDEwMDAwOjAwOjAxLjA6IHJl
ZyAweDEwOiBbbWVtIDB4YWUxMDgwMDAtMHhhZTEwYmZmZiA2NGJpdF0KWyAgICA3LjQzMzkwN10g
cGNpIDEwMDAwOjAwOjAxLjA6IEFkZGluZyB0byBpb21tdSBncm91cCAxMwpbICAgIDcuNDMzOTE2
XSBwY2kgMTAwMDA6MDA6MDEuMDogVXNpbmcgaW9tbXUgZGlyZWN0IG1hcHBpbmcKWyAgICA3LjQz
MzkyNF0gcGNpIDEwMDAwOjAwOjAyLjA6IFs4MDg2OjAwMDBdIHR5cGUgMDAgY2xhc3MgMHgwMTA4
MDIKWyAgICA3LjQzMzkyNl0gcGNpIDEwMDAwOjAwOjAyLjA6IHJlZyAweDEwOiBbbWVtIDB4YWUx
MGMwMDAtMHhhZTEwZmZmZiA2NGJpdF0KWyAgICA3LjQzMzk2Nl0gcGNpIDEwMDAwOjAwOjAyLjA6
IEZhaWxlZCB0byBhZGQgdG8gaW9tbXUgZ3JvdXAgMTQ6IC0xNgpbICAgIDcuNDMzOTc5XSAtLS0t
LS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KWyAgICA3LjQzMzk4MF0ga2VybmVsIEJV
RyBhdCBkcml2ZXJzL2lvbW11L2RtYXIuYzoyNjEhClsgICAgNy40MzM5ODNdIGludmFsaWQgb3Bj
b2RlOiAwMDAwIFsjMV0gU01QIE5PUFRJClsgICAgNy40MzM5ODVdIENQVTogNiBQSUQ6IDM3MyBD
b21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVkIDUuNC4wKyAjMgpbICAgIDcuNDMzOTg2XSBI
YXJkd2FyZSBuYW1lOiBBU1VTVGVLIENPTVBVVEVSIElOQy4gQVNVU1BSTwpCOTQ1MEZBX0I5NDUw
RkEvQjk0NTBGQSwgQklPUyBCOTQ1MEZBLjIwNS5UMDQgMTIvMTAvMjAxOQpbICAgIDcuNDMzOTg5
XSBSSVA6IDAwMTA6ZG1hcl9pbnNlcnRfZGV2X3Njb3BlKzB4MTNjLzB4MWEwClsgICAgNy40MzM5
OTBdIENvZGU6IDBmIDg1IDRjIDEwIDAwIDAwIDQ1IDg1IGM5IDdlIDFmIDQ5IDhiIDA4IDQ5IDhk
CjUwIDEwIDMxIGMwIGViIDA3IDQ4IDhiIDBhIDQ4IDgzIGMyIDEwIDQ4IDg1IGM5IDc0IDBhIDgz
IGMwIDAxIDQxIDM5CmMxIDc1IGVjIDwwZj4gMGIgNDggOTggNDkgOGQgYmMgMjQgYjAgMDAgMDAg
MDAgNDggYzEgZTAgMDQgNDkgOGQgMWMgMDAKNDggOGIKWyAgICA3LjQzMzk5MV0gUlNQOiAwMDE4
OmZmZmY5YjY1MDA3OWY4YjAgRUZMQUdTOiAwMDAxMDI0NgpbICAgIDcuNDMzOTkyXSBSQVg6IDAw
MDAwMDAwMDAwMDAwMDEgUkJYOiBmZmZmOTdmODNjMzY4OGU4IFJDWDogZmZmZjk3ZjgzYjVjNTBi
MApbICAgIDcuNDMzOTkzXSBSRFg6IGZmZmY5N2Y4M2MzNmQwNjAgUlNJOiAwMDAwMDAwMDAwMDAw
MDAxIFJESTogMDAwMDAwMDAwMDAwMDAwOApbICAgIDcuNDMzOTkzXSBSQlA6IGZmZmZmZmZmOGM2
MGEwZTAgUjA4OiBmZmZmOTdmODNjMzZkMDUwIFIwOTogMDAwMDAwMDAwMDAwMDAwMQpbICAgIDcu
NDMzOTk0XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDEgUjExOiAwMDAwMDAwMDAwMDAwMDAwIFIxMjog
ZmZmZjk3ZjgzOGY1ODAwMApbICAgIDcuNDMzOTk0XSBSMTM6IGZmZmZmZmZmOGM2MGEwZmMgUjE0
OiBmZmZmZmZmZjhjNjBhMGZjIFIxNTogMDAwMDAwMDAwMDAwMDAwMApbICAgIDcuNDMzOTk1XSBG
UzogIDAwMDA3ZjgyODRmYTNkNDAoMDAwMCkgR1M6ZmZmZjk3ZjgzZGQ4MDAwMCgwMDAwKQprbmxH
UzowMDAwMDAwMDAwMDAwMDAwClsgICAgNy40MzM5OTZdIENTOiAgMDAxMCBEUzogMDAwMCBFUzog
MDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWyAgICA3LjQzMzk5Nl0gQ1IyOiAwMDAwN2Y3YTdh
MjhiMDAwIENSMzogMDAwMDAwMDQ2MjMwNjAwNiBDUjQ6IDAwMDAwMDAwMDAzNjA2ZTAKWyAgICA3
LjQzMzk5N10gQ2FsbCBUcmFjZToKWyAgICA3LjQzNDAwMF0gIGRtYXJfcGNpX2J1c19hZGRfZGV2
KzB4M2UvMHg4MApbICAgIDcuNDM0MDAxXSAgZG1hcl9wY2lfYnVzX25vdGlmaWVyKzB4OTAvMHhl
MApbICAgIDcuNDM0MDAzXSAgbm90aWZpZXJfY2FsbF9jaGFpbisweDQ0LzB4NzAKWyAgICA3LjQz
NDAwNF0gIGJsb2NraW5nX25vdGlmaWVyX2NhbGxfY2hhaW4rMHg0My8weDYwClsgICAgNy40MzQw
MDZdICBkZXZpY2VfYWRkKzB4MzVkLzB4NjQwClsgICAgNy40MzQwMDhdICBwY2lfZGV2aWNlX2Fk
ZCsweDFmOC8weDU4MApbICAgIDcuNDM0MDA5XSAgPyBwY2lfc2V0dXBfZGV2aWNlKzB4MzA0LzB4
NmQwClsgICAgNy40MzQwMTBdICBwY2lfc2Nhbl9zaW5nbGVfZGV2aWNlKzB4OWYvMHhjMApbICAg
IDcuNDM0MDExXSAgcGNpX3NjYW5fc2xvdCsweDRkLzB4MTAwClsgICAgNy40MzQwMTNdICBwY2lf
c2Nhbl9jaGlsZF9idXNfZXh0ZW5kKzB4MzAvMHgyMTAKWyAgICA3LjQzNDAxNV0gIG52bWVfcmVt
YXBfcHJvYmUuY29sZCsweDEwOS8weDE3MSBbaW50ZWxfbnZtZV9yZW1hcF0KWyAgICA3LjQzNDAx
Nl0gIGxvY2FsX3BjaV9wcm9iZSsweDM4LzB4NzAKWyAgICA3LjQzNDAxOF0gID8gcGNpX2Fzc2ln
bl9pcnErMHgyMi8weGMwClsgICAgNy40MzQwMTldICBwY2lfZGV2aWNlX3Byb2JlKzB4ZDAvMHgx
NTAKWyAgICA3LjQzNDAyMF0gIHJlYWxseV9wcm9iZSsweGRmLzB4MjkwClsgICAgNy40MzQwMjFd
ICBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4NGIvMHhjMApbICAgIDcuNDM0MDIyXSAgZGV2aWNlX2Ry
aXZlcl9hdHRhY2grMHg0ZS8weDYwClsgICAgNy40MzQwMjNdICBfX2RyaXZlcl9hdHRhY2grMHg0
NC8weGIwClsgICAgNy40MzQwMjRdICA/IGRldmljZV9kcml2ZXJfYXR0YWNoKzB4NjAvMHg2MApb
ICAgIDcuNDM0MDI2XSAgYnVzX2Zvcl9lYWNoX2RldisweDZjLzB4YjAKWyAgICA3LjQzNDAyN10g
IGJ1c19hZGRfZHJpdmVyKzB4MTcyLzB4MWMwClsgICAgNy40MzQwMjhdICBkcml2ZXJfcmVnaXN0
ZXIrMHg2Ny8weGIwClsgICAgNy40MzQwMjldICA/IDB4ZmZmZmZmZmZjMDIxZDAwMApbICAgIDcu
NDM0MDMwXSAgZG9fb25lX2luaXRjYWxsKzB4M2UvMHgxY2YKWyAgICA3LjQzNDAzMl0gID8gZnJl
ZV92bWFwX2FyZWFfbm9mbHVzaCsweDhkLzB4ZTAKWyAgICA3LjQzNDAzNF0gID8gX2NvbmRfcmVz
Y2hlZCsweDEwLzB4MjAKWyAgICA3LjQzNDAzNl0gID8ga21lbV9jYWNoZV9hbGxvY190cmFjZSsw
eDNhLzB4MWIwClsgICAgNy40MzQwMzhdICBkb19pbml0X21vZHVsZSsweDU2LzB4MjAwClsgICAg
Ny40MzQwMzldICBsb2FkX21vZHVsZSsweDIyMDIvMHgyNGQwClsgICAgNy40MzQwNDFdICA/IF9f
ZG9fc3lzX2Zpbml0X21vZHVsZSsweGJmLzB4ZTAKWyAgICA3LjQzNDA0Ml0gIF9fZG9fc3lzX2Zp
bml0X21vZHVsZSsweGJmLzB4ZTAKWyAgICA3LjQzNDA0NF0gIGRvX3N5c2NhbGxfNjQrMHgzZC8w
eDExMApbICAgIDcuNDM0MDQ1XSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQv
MHhhOQpbICAgIDcuNDM0MDQ2XSBSSVA6IDAwMzM6MHg3ZjgyODU1OTEyYTkKWyAgICA3LjQzNDA0
OF0gQ29kZTogMDAgYzMgNjYgMmUgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgMGYgMWYgNDQgMDAK
MDAgNDggODkgZjggNDggODkgZjcgNDggODkgZDYgNDggODkgY2EgNGQgODkgYzIgNGQgODkgYzgg
NGMgOGIgNGMgMjQKMDggMGYgMDUgPDQ4PiAzZCAwMSBmMCBmZiBmZiA3MyAwMSBjMyA0OCA4YiAw
ZCBiNyA2YiAwYyAwMCBmNyBkOCA2NCA4OQowMSA0OApbICAgIDcuNDM0MDQ4XSBSU1A6IDAwMmI6
MDAwMDdmZmQ0YjRmMGQ1OCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOgowMDAwMDAwMDAwMDAw
MTM5ClsgICAgNy40MzQwNDldIFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA1NjAyMzQy
ZjZjODAgUkNYOiAwMDAwN2Y4Mjg1NTkxMmE5ClsgICAgNy40MzQwNDldIFJEWDogMDAwMDAwMDAw
MDAwMDAwMCBSU0k6IDAwMDA3ZjgyODU0OTVjYWQgUkRJOiAwMDAwMDAwMDAwMDAwMDA2ClsgICAg
Ny40MzQwNTBdIFJCUDogMDAwMDdmODI4NTQ5NWNhZCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5
OiAwMDAwNTYwMjM0MmY2YzgwClsgICAgNy40MzQwNTBdIFIxMDogMDAwMDAwMDAwMDAwMDAwNiBS
MTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwClsgICAgNy40MzQwNTFd
IFIxMzogMDAwMDU2MDIzNDMwMWE5MCBSMTQ6IDAwMDAwMDAwMDAwMjAwMDAgUjE1OiAwMDAwNTYw
MjM0MmY2YzgwClsgICAgNy40MzQwNTFdIE1vZHVsZXMgbGlua2VkIGluOiBpbnRlbF9udm1lX3Jl
bWFwKCspIGVmaXZhcmZzClsgICAgNy40MzQwNTRdIC0tLVsgZW5kIHRyYWNlIDIwNGEzNTc0MDEx
MjNmMGEgXS0tLQoKICAgVGhlcmUgYXJlIDMgUENJIGRldmljZXMgd2lsbCBiZSBwcm9kdWNlZCBi
eSBpbnRlbC1udm1lLXJlbWFwOgoxMDAwMDowMDowMC4wIChmYWtlIFNBVEEgY29udHJvbGxlciBt
YXBwZWQgdG8gUkFJRCBidXMgY29udHJvbGxlciksCjEwMDAwOjAwOjAxLjAgKGZha2UgTlZNZSBt
YXBwZWQgdG8gcmVhbCBOVk1lKSBhbmQgMTAwMDA6MDA6MDIuMCAoZmFrZQpOVk1lIG1hcHBlZCB0
byByZWFsIE5WTWUpLgogICBXZSBjaGVja2VkIHRoZSBETUFSIHRhYmxlOgoKLyoKICogSW50ZWwg
QUNQSSBDb21wb25lbnQgQXJjaGl0ZWN0dXJlCiAqIEFNTC9BU0wrIERpc2Fzc2VtYmxlciB2ZXJz
aW9uIDIwMjAwMTEwICg2NC1iaXQgdmVyc2lvbikKICogQ29weXJpZ2h0IChjKSAyMDAwIC0gMjAy
MCBJbnRlbCBDb3Jwb3JhdGlvbgogKgogKiBEaXNhc3NlbWJseSBvZiBkbWFyLmRhdCwgV2VkIEph
biAyMiAxMTo0MTo1MCAyMDIwCiAqCiAqIEFDUEkgRGF0YSBUYWJsZSBbRE1BUl0KICoKICogRm9y
bWF0OiBbSGV4T2Zmc2V0IERlY2ltYWxPZmZzZXQgQnl0ZUxlbmd0aF0gIEZpZWxkTmFtZSA6IEZp
ZWxkVmFsdWUKICovCgpbMDAwaCAwMDAwICAgNF0gICAgICAgICAgICAgICAgICAgIFNpZ25hdHVy
ZSA6ICJETUFSIiAgICBbRE1BIFJlbWFwcGluZyB0YWJsZV0KWzAwNGggMDAwNCAgIDRdICAgICAg
ICAgICAgICAgICBUYWJsZSBMZW5ndGggOiAwMDAwMDBBOApbMDA4aCAwMDA4ICAgMV0gICAgICAg
ICAgICAgICAgICAgICBSZXZpc2lvbiA6IDAxClswMDloIDAwMDkgICAxXSAgICAgICAgICAgICAg
ICAgICAgIENoZWNrc3VtIDogNUUKWzAwQWggMDAxMCAgIDZdICAgICAgICAgICAgICAgICAgICAg
ICBPZW0gSUQgOiAiSU5URUwgIgpbMDEwaCAwMDE2ICAgOF0gICAgICAgICAgICAgICAgIE9lbSBU
YWJsZSBJRCA6ICJFREsyICAgICIKWzAxOGggMDAyNCAgIDRdICAgICAgICAgICAgICAgICBPZW0g
UmV2aXNpb24gOiAwMDAwMDAwMgpbMDFDaCAwMDI4ICAgNF0gICAgICAgICAgICAgIEFzbCBDb21w
aWxlciBJRCA6ICIgICAgIgpbMDIwaCAwMDMyICAgNF0gICAgICAgIEFzbCBDb21waWxlciBSZXZp
c2lvbiA6IDAxMDAwMDEzCgpbMDI0aCAwMDM2ICAgMV0gICAgICAgICAgIEhvc3QgQWRkcmVzcyBX
aWR0aCA6IDI2ClswMjVoIDAwMzcgICAxXSAgICAgICAgICAgICAgICAgICAgICAgIEZsYWdzIDog
MDUKWzAyNmggMDAzOCAgMTBdICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgOiAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMAoKWzAzMGggMDA0OCAgIDJdICAgICAgICAgICAgICAgIFN1
YnRhYmxlIFR5cGUgOiAwMDAwIFtIYXJkd2FyZSBVbml0IERlZmluaXRpb25dClswMzJoIDAwNTAg
ICAyXSAgICAgICAgICAgICAgICAgICAgICAgTGVuZ3RoIDogMDAxOAoKWzAzNGggMDA1MiAgIDFd
ICAgICAgICAgICAgICAgICAgICAgICAgRmxhZ3MgOiAwMApbMDM1aCAwMDUzICAgMV0gICAgICAg
ICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAwClswMzZoIDAwNTQgICAyXSAgICAgICAgICAgUENJ
IFNlZ21lbnQgTnVtYmVyIDogMDAwMApbMDM4aCAwMDU2ICAgOF0gICAgICAgIFJlZ2lzdGVyIEJh
c2UgQWRkcmVzcyA6IDAwMDAwMDAwRkVEOTAwMDAKClswNDBoIDAwNjQgICAxXSAgICAgICAgICAg
IERldmljZSBTY29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdClswNDFoIDAwNjUg
ICAxXSAgICAgICAgICAgICAgICAgRW50cnkgTGVuZ3RoIDogMDgKWzA0MmggMDA2NiAgIDJdICAg
ICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgOiAwMDAwClswNDRoIDAwNjggICAxXSAgICAgICAg
ICAgICAgIEVudW1lcmF0aW9uIElEIDogMDAKWzA0NWggMDA2OSAgIDFdICAgICAgICAgICAgICAg
UENJIEJ1cyBOdW1iZXIgOiAwMAoKWzA0NmggMDA3MCAgIDJdICAgICAgICAgICAgICAgICAgICAg
UENJIFBhdGggOiAwMiwwMAoKClswNDhoIDAwNzIgICAyXSAgICAgICAgICAgICAgICBTdWJ0YWJs
ZSBUeXBlIDogMDAwMCBbSGFyZHdhcmUgVW5pdCBEZWZpbml0aW9uXQpbMDRBaCAwMDc0ICAgMl0g
ICAgICAgICAgICAgICAgICAgICAgIExlbmd0aCA6IDAwMjAKClswNENoIDAwNzYgICAxXSAgICAg
ICAgICAgICAgICAgICAgICAgIEZsYWdzIDogMDEKWzA0RGggMDA3NyAgIDFdICAgICAgICAgICAg
ICAgICAgICAgUmVzZXJ2ZWQgOiAwMApbMDRFaCAwMDc4ICAgMl0gICAgICAgICAgIFBDSSBTZWdt
ZW50IE51bWJlciA6IDAwMDAKWzA1MGggMDA4MCAgIDhdICAgICAgICBSZWdpc3RlciBCYXNlIEFk
ZHJlc3MgOiAwMDAwMDAwMEZFRDkxMDAwCgpbMDU4aCAwMDg4ICAgMV0gICAgICAgICAgICBEZXZp
Y2UgU2NvcGUgVHlwZSA6IDAzIFtJT0FQSUMgRGV2aWNlXQpbMDU5aCAwMDg5ICAgMV0gICAgICAg
ICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDA4ClswNUFoIDAwOTAgICAyXSAgICAgICAgICAgICAg
ICAgICAgIFJlc2VydmVkIDogMDAwMApbMDVDaCAwMDkyICAgMV0gICAgICAgICAgICAgICBFbnVt
ZXJhdGlvbiBJRCA6IDAyClswNURoIDAwOTMgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVt
YmVyIDogMDAKClswNUVoIDAwOTQgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDog
MUUsMDcKCgpbMDYwaCAwMDk2ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDA0
IFtNZXNzYWdlLWNhcGFibGUgSFBFVCBEZXZpY2VdClswNjFoIDAwOTcgICAxXSAgICAgICAgICAg
ICAgICAgRW50cnkgTGVuZ3RoIDogMDgKWzA2MmggMDA5OCAgIDJdICAgICAgICAgICAgICAgICAg
ICAgUmVzZXJ2ZWQgOiAwMDAwClswNjRoIDAxMDAgICAxXSAgICAgICAgICAgICAgIEVudW1lcmF0
aW9uIElEIDogMDAKWzA2NWggMDEwMSAgIDFdICAgICAgICAgICAgICAgUENJIEJ1cyBOdW1iZXIg
OiAwMAoKWzA2NmggMDEwMiAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAxRSww
NgoKClswNjhoIDAxMDQgICAyXSAgICAgICAgICAgICAgICBTdWJ0YWJsZSBUeXBlIDogMDAwMSBb
UmVzZXJ2ZWQgTWVtb3J5IFJlZ2lvbl0KWzA2QWggMDEwNiAgIDJdICAgICAgICAgICAgICAgICAg
ICAgICBMZW5ndGggOiAwMDIwCgpbMDZDaCAwMTA4ICAgMl0gICAgICAgICAgICAgICAgICAgICBS
ZXNlcnZlZCA6IDAwMDAKWzA2RWggMDExMCAgIDJdICAgICAgICAgICBQQ0kgU2VnbWVudCBOdW1i
ZXIgOiAwMDAwClswNzBoIDAxMTIgICA4XSAgICAgICAgICAgICAgICAgQmFzZSBBZGRyZXNzIDog
MDAwMDAwMDA2RjU4QjAwMApbMDc4aCAwMTIwICAgOF0gICAgICAgICAgRW5kIEFkZHJlc3MgKGxp
bWl0KSA6IDAwMDAwMDAwNkY3RDRGRkYKClswODBoIDAxMjggICAxXSAgICAgICAgICAgIERldmlj
ZSBTY29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdClswODFoIDAxMjkgICAxXSAg
ICAgICAgICAgICAgICAgRW50cnkgTGVuZ3RoIDogMDgKWzA4MmggMDEzMCAgIDJdICAgICAgICAg
ICAgICAgICAgICAgUmVzZXJ2ZWQgOiAwMDAwClswODRoIDAxMzIgICAxXSAgICAgICAgICAgICAg
IEVudW1lcmF0aW9uIElEIDogMDAKWzA4NWggMDEzMyAgIDFdICAgICAgICAgICAgICAgUENJIEJ1
cyBOdW1iZXIgOiAwMAoKWzA4NmggMDEzNCAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBh
dGggOiAxNCwwMAoKClswODhoIDAxMzYgICAyXSAgICAgICAgICAgICAgICBTdWJ0YWJsZSBUeXBl
IDogMDAwMSBbUmVzZXJ2ZWQgTWVtb3J5IFJlZ2lvbl0KWzA4QWggMDEzOCAgIDJdICAgICAgICAg
ICAgICAgICAgICAgICBMZW5ndGggOiAwMDIwCgpbMDhDaCAwMTQwICAgMl0gICAgICAgICAgICAg
ICAgICAgICBSZXNlcnZlZCA6IDAwMDAKWzA4RWggMDE0MiAgIDJdICAgICAgICAgICBQQ0kgU2Vn
bWVudCBOdW1iZXIgOiAwMDAwClswOTBoIDAxNDQgICA4XSAgICAgICAgICAgICAgICAgQmFzZSBB
ZGRyZXNzIDogMDAwMDAwMDA3OTgwMDAwMApbMDk4aCAwMTUyICAgOF0gICAgICAgICAgRW5kIEFk
ZHJlc3MgKGxpbWl0KSA6IDAwMDAwMDAwN0RGRkZGRkYKClswQTBoIDAxNjAgICAxXSAgICAgICAg
ICAgIERldmljZSBTY29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdClswQTFoIDAx
NjEgICAxXSAgICAgICAgICAgICAgICAgRW50cnkgTGVuZ3RoIDogMDgKWzBBMmggMDE2MiAgIDJd
ICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgOiAwMDAwClswQTRoIDAxNjQgICAxXSAgICAg
ICAgICAgICAgIEVudW1lcmF0aW9uIElEIDogMDAKWzBBNWggMDE2NSAgIDFdICAgICAgICAgICAg
ICAgUENJIEJ1cyBOdW1iZXIgOiAwMAoKWzBBNmggMDE2NiAgIDJdICAgICAgICAgICAgICAgICAg
ICAgUENJIFBhdGggOiAwMiwwMAoKClJhdyBUYWJsZSBEYXRhOiBMZW5ndGggMTY4ICgweEE4KQoK
ICAgIDAwMDA6IDQ0IDREIDQxIDUyIEE4IDAwIDAwIDAwIDAxIDVFIDQ5IDRFIDU0IDQ1IDRDIDIw
ICAvLyBETUFSLi4uLi5eSU5URUwKICAgIDAwMTA6IDQ1IDQ0IDRCIDMyIDIwIDIwIDIwIDIwIDAy
IDAwIDAwIDAwIDIwIDIwIDIwIDIwICAvLyBFREsyICAgIC4uLi4KICAgIDAwMjA6IDEzIDAwIDAw
IDAxIDI2IDA1IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAvLyAuLi4uJi4uLi4uLi4u
Li4uCiAgICAwMDMwOiAwMCAwMCAxOCAwMCAwMCAwMCAwMCAwMCAwMCAwMCBEOSBGRSAwMCAwMCAw
MCAwMCAgLy8gLi4uLi4uLi4uLi4uLi4uLgogICAgMDA0MDogMDEgMDggMDAgMDAgMDAgMDAgMDIg
MDAgMDAgMDAgMjAgMDAgMDEgMDAgMDAgMDAgIC8vIC4uLi4uLi4uLi4gLi4uLi4KICAgIDAwNTA6
IDAwIDEwIEQ5IEZFIDAwIDAwIDAwIDAwIDAzIDA4IDAwIDAwIDAyIDAwIDFFIDA3ICAvLyAuLi4u
Li4uLi4uLi4uLi4uCiAgICAwMDYwOiAwNCAwOCAwMCAwMCAwMCAwMCAxRSAwNiAwMSAwMCAyMCAw
MCAwMCAwMCAwMCAwMCAgLy8gLi4uLi4uLi4uLiAuLi4uLgogICAgMDA3MDogMDAgQjAgNTggNkYg
MDAgMDAgMDAgMDAgRkYgNEYgN0QgNkYgMDAgMDAgMDAgMDAgIC8vIC4uWG8uLi4uLk99by4uLi4K
ICAgIDAwODA6IDAxIDA4IDAwIDAwIDAwIDAwIDE0IDAwIDAxIDAwIDIwIDAwIDAwIDAwIDAwIDAw
ICAvLyAuLi4uLi4uLi4uIC4uLi4uCiAgICAwMDkwOiAwMCAwMCA4MCA3OSAwMCAwMCAwMCAwMCBG
RiBGRiBGRiA3RCAwMCAwMCAwMCAwMCAgLy8gLi4ueS4uLi4uLi59Li4uLgogICAgMDBBMDogMDEg
MDggMDAgMDAgMDAgMDAgMDIgMDAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIC4uLi4uLi4u
CgogICBUaGUgcG9zc2libGUgUENJIEVuZHBvaW50IERldmljZXMgd2l0aCBETUFSIGZlYXR1cmUg
bG9jYXRlIGF0CjAwMDA6MDA6MDI6MDAgYW5kIDAwMDA6MDA6MTQ6MDAuCgogICBBZnRlciB0cmFj
aW5nIGNvZGUsIHdlIGZvdW5kIGl0IGNvbWVzIGZyb20gdGhlIHdyb25nIGRvbWFpbi9zZWdtZW50
Cm51bWJlciwgYmVjYXVzZSBvZiB0aGUgc2VnbWVudCdzIHVubWF0Y2hlZCBkYXRhdHlwZS4gIEl0
IGlzIHRydW5jYXRlZAp0byBhIHdyb25nIG51bWJlciwgdGhlbiB3cm9uZyBiZWhhdmlvci4KICAg
VGhlIGZha2UgMTAwMDA6MDA6MDIuMCB3aWxsIGJlIHRydW5jYXRlZCB0byAwMDAwOjAwOjAyLjAu
ICBJdCBpcwp0aGUgc2FtZSBQQ0kgcGF0aCBvZiBvcmlnaW5hbCByZWFsIFBDSSBkZXZpY2UgMDAw
MDowMDowMi4wLCB3aGljaCBpcyBhClZHQS4gIFRoaXMgY29uZmxpY3QgbWFrZXMgMTAwMDA6MDA6
MDIuMCB0cnkgdG8gdGFrZSB0aGUgc2FtZSBzY29wZSBvZgowMDAwOjAwOjAyLjAuICBCdXQgdGhl
IHNjb3BlIGNhbiBvbmx5IGJlIHRha2VuIG9uY2UuICBUaGVuLCB0aGlzIGxlYWRzCnRvIEJVR19P
Ti4KCiAgIFNvLCBJIHByZXBhcmUgYW5vdGhlciBmaXg6IENoYW5nZSB0aGUgZG9tYWluIG51bWJl
ciBmcm9tIDB4MTAwMDArCnRvIG5leHQgZnJlZSBkb21haW4gWzddLiAgSXQgd2lsbCBiZSBkb21h
aW4gMHgwMDAxLCB3aGljaCBjYW4gc2l0IGluCnUxNiBmb3IgbW9zdCBtYWNoaW5lcy4KICAgTm93
LCBubyBCVUdfT04sIHRoZSBmYWtlIFNBVEEgY29udHJvbGxlciBhbmQgdHdvIGZha2UgTlZNZSBT
U0QgUENJCmRldmljZXMgc2hvdyB1cC4gIEJlY2F1c2Ugb2Ygbm8gbWF0Y2hlZCBzZWdtZW50IDB4
MDAwMSBpbiBkcmhkIFs4XSwKTlVMTCBpcyByZXR1cm5lZCBhcyB0aGUgaW9tbXUgZnJvbSBkZXZp
Y2VfdG9faW9tbXUoKS4KCiAgIEhvd2V2ZXIsIHN0aWxsIG5vbmUgb2YgdGhlIE5WTWUgU1NEIGRl
dmljZSBub2RlIGxvY2F0ZXMgdW5kZXIgL2Rldi4KCkl0ZW0gMjoKICAgV2UgZm91bmQgdGhlIE5W
TWUgU1NEcyBhcmUgcHJvYmVkLCBidXQgYWxzbyByZW1vdmVkIGR1ZSB0byBmYWlsdXJlLgoKWyAg
ICA4LjE1NjU5M10gbnZtZSBudm1lMTogUmVtb3ZpbmcgYWZ0ZXIgcHJvYmUgZmFpbHVyZSBzdGF0
dXM6IC0xMgpbICAgIDguMTU2NzgzXSBudm1lIG52bWUwOiBSZW1vdmluZyBhZnRlciBwcm9iZSBm
YWlsdXJlIHN0YXR1czogLTEyCgogICBBY2NvcmRpbmcgdG8gZHVtcGVkIHN0YWNrIHRyYWNlOgoK
WyAgICA3LjkzOTYyMF0gbnZtZSBudm1lMDogcGNpIGZ1bmN0aW9uIDAwMDE6MDA6MDEuMApbICAg
IDcuOTM5ODg5XSBudm1lIG52bWUxOiBwY2kgZnVuY3Rpb24gMDAwMTowMDowMi4wClsgICAgOC4w
NDU4MzZdIG52bWUgMDAwMTowMDowMi4wOiBETUFSOiBpb21tdV9kdW1teTogaW4KWyAgICA4LjA0
NTgzN10gbnZtZSAwMDAxOjAwOjAxLjA6IERNQVI6IGlvbW11X2R1bW15OiBpbgpbICAgIDguMDQ1
ODQwXSBDUFU6IDcgUElEOiAxMjMyIENvbW06IGt3b3JrZXIvdTE2OjcgTm90IHRhaW50ZWQgNS40
LjArICMxMDUKWyAgICA4LjA0NTg0MF0gSGFyZHdhcmUgbmFtZTogQVNVU1RlSyBDT01QVVRFUiBJ
TkMuIEFTVVNQUk8KQjk0NTBGQV9COTQ1MEZBL0I5NDUwRkEsIEJJT1MgQjk0NTBGQS4yMDUuVDA0
IDEyLzEwLzIwMTkKWyAgICA4LjA0NTg0NV0gV29ya3F1ZXVlOiBudm1lLXJlc2V0LXdxIG52bWVf
cmVzZXRfd29yawpbICAgIDguMDQ1ODQ2XSBDYWxsIFRyYWNlOgpbICAgIDguMDQ1ODUyXSAgZHVt
cF9zdGFjaysweDUwLzB4NzAKWyAgICA4LjA0NTg1NF0gIGlvbW11X2R1bW15LmNvbGQrMHgxYy8w
eDI1ClsgICAgOC4wNDU4NTZdICBpb21tdV9uZWVkX21hcHBpbmcrMHhlLzB4MTEwClsgICAgOC4w
NDU4NTddICBpbnRlbF9hbGxvY19jb2hlcmVudCsweDFkLzB4MTAwClsgICAgOC4wNDU4NTldICBu
dm1lX2FsbG9jX3F1ZXVlKzB4NTUvMHgxNjAKWyAgICA4LjA0NTg2MV0gIG52bWVfcmVzZXRfd29y
aysweDMzMC8weDEyZTAKWyAgICA4LjA0NTg2NF0gID8gZW5xdWV1ZV90YXNrX2ZhaXIrMHgxYTcv
MHg3NzAKWyAgICA4LjA0NTg2NV0gID8gbmV3aWRsZV9iYWxhbmNlKzB4MWVjLzB4MzQwClsgICAg
OC4wNDU4NjZdICA/IGNoZWNrX3ByZWVtcHRfY3VycisweDQ1LzB4ODAKWyAgICA4LjA0NTg2N10g
ID8gdHR3dV9kb193YWtldXAuaXNyYS4wKzB4Zi8weGQwClsgICAgOC4wNDU4NjhdICA/IHRyeV90
b193YWtlX3VwKzB4Mzg3LzB4NTcwClsgICAgOC4wNDU4NzFdICBwcm9jZXNzX29uZV93b3JrKzB4
MWQ1LzB4MzcwClsgICAgOC4wNDU4NzNdICB3b3JrZXJfdGhyZWFkKzB4NDUvMHgzYzAKWyAgICA4
LjA0NTg3NV0gIGt0aHJlYWQrMHhmMy8weDEzMApbICAgIDguMDQ1ODc2XSAgPyBwcm9jZXNzX29u
ZV93b3JrKzB4MzcwLzB4MzcwClsgICAgOC4wNDU4NzddICA/IGt0aHJlYWRfcGFyaysweDgwLzB4
ODAKWyAgICA4LjA0NTg3OV0gIHJldF9mcm9tX2ZvcmsrMHgxZi8weDMwClsgICAgOC4wNDU4ODJd
IENQVTogMyBQSUQ6IDU3IENvbW06IGt3b3JrZXIvdTE2OjEgTm90IHRhaW50ZWQgNS40LjArICMx
MDUKWyAgICA4LjA0NTg4Ml0gbnZtZSAwMDAxOjAwOjAxLjA6IERNQVI6IGlkZW50aXR5X21hcHBp
bmc6IGluClsgICAgOC4wNDU4ODNdIEhhcmR3YXJlIG5hbWU6IEFTVVNUZUsgQ09NUFVURVIgSU5D
LiBBU1VTUFJPCkI5NDUwRkFfQjk0NTBGQS9COTQ1MEZBLCBCSU9TIEI5NDUwRkEuMjA1LlQwNCAx
Mi8xMC8yMDE5ClsgICAgOC4wNDU4ODVdIFdvcmtxdWV1ZTogbnZtZS1yZXNldC13cSBudm1lX3Jl
c2V0X3dvcmsKWyAgICA4LjA0NTg4NV0gQ2FsbCBUcmFjZToKWyAgICA4LjA0NTg4N10gIGR1bXBf
c3RhY2srMHg1MC8weDcwClsgICAgOC4wNDU4ODhdICBpb21tdV9kdW1teS5jb2xkKzB4MWMvMHgy
NQpbICAgIDguMDQ1ODg5XSAgaW9tbXVfbmVlZF9tYXBwaW5nKzB4ZS8weDExMApbICAgIDguMDQ1
ODkwXSAgaW50ZWxfYWxsb2NfY29oZXJlbnQrMHgxZC8weDEwMApbICAgIDguMDQ1ODkyXSAgbnZt
ZV9hbGxvY19xdWV1ZSsweDU1LzB4MTYwClsgICAgOC4wNDU4OTNdICBudm1lX3Jlc2V0X3dvcmsr
MHgzMzAvMHgxMmUwClsgICAgOC4wNDU4OTVdICA/IGVucXVldWVfdGFza19mYWlyKzB4MWE3LzB4
NzcwClsgICAgOC4wNDU4OTZdICA/IG5ld2lkbGVfYmFsYW5jZSsweDFlYy8weDM0MApbICAgIDgu
MDQ1ODk3XSAgPyBjaGVja19wcmVlbXB0X2N1cnIrMHg0NS8weDgwClsgICAgOC4wNDU4OThdICA/
IHR0d3VfZG9fd2FrZXVwLmlzcmEuMCsweGYvMHhkMApbICAgIDguMDQ1ODk5XSAgPyB0cnlfdG9f
d2FrZV91cCsweDM4Ny8weDU3MApbICAgIDguMDQ1OTAxXSAgcHJvY2Vzc19vbmVfd29yaysweDFk
NS8weDM3MApbICAgIDguMDQ1OTAyXSAgd29ya2VyX3RocmVhZCsweDQ1LzB4M2MwClsgICAgOC4w
NDU5MDRdICBrdGhyZWFkKzB4ZjMvMHgxMzAKWyAgICA4LjA0NTkwNV0gID8gcHJvY2Vzc19vbmVf
d29yaysweDM3MC8weDM3MApbICAgIDguMDQ1OTA3XSAgPyBrdGhyZWFkX3BhcmsrMHg4MC8weDgw
ClsgICAgOC4wNDU5MDhdICByZXRfZnJvbV9mb3JrKzB4MWYvMHgzMApbICAgIDguMDQ1OTEwXSBD
UFU6IDcgUElEOiAxMjMyIENvbW06IGt3b3JrZXIvdTE2OjcgTm90IHRhaW50ZWQgNS40LjArICMx
MDUKCiAgIFdlIGZvdW5kIGludGVsX2FsbG9jX2NvaGVyZW50IHdpbGwgY2hlY2sgdGhlIGRldmlj
ZSB0aGF0IG5lZWRzCmlvbW11IG1hcHBpbmcgb3Igbm90IFs5XS4gIElmIGl0IGRvZXMgbm90LCB0
aGVuIGl0IGdvZXMgdG8KZG1hX2RpcmVjdF9hbGxvYygpIGFuZCByZXR1cm5zLiAgT3RoZXJ3aXNl
LCBpdCBnb2VzIHRvIElPTU1VIG1hcHBpbmcKc3R1ZmYuICBGcm9tIGl0ZW0gMSwgc2luY2UgdGhl
IGZha2UgTlZNZSBTU0RzIGhhdmUgbm8gSU9NTVUgKE5VTEwpLAp0aGV5IHNob3VsZCB1c2UgZG1h
X2RpcmVjdF9hbGxvYygpIGZvciBpbnRlbF9hbGxvY19jb2hlcmVudCwgYnV0IHRoZQpjdXJyZW50
IGNvZGUgbGVhZHMgdG8gSU9NTVUgbWFwcGluZyBzdHVmZi4gIFNvIEkgcHJvcG9zZSB0aGUgcGF0
Y2gKaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvMi8zLzc5IC4KICAgVGhlIGZha2UgTlZNZSBk
ZXZpY2Ugbm9kZXMgc2hvdyB1cCB3aXRoIHRoZSBwYXRjaCBpcyBhcHBsaWVkLgoKWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9lbmRsZXNzbS9saW51eC9jb21taXQvZTE4Y2QyNTczMTIyYjgxM2FmZjRh
NGUyOTg2ZGE1ZWJlZGVhMjcwNgpbMl0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djUuNS4yL3NvdXJjZS9pbmNsdWRlL2xpbnV4L2RtYXIuaCNMNjAKWzNdIGh0dHBzOi8vZWxpeGly
LmZyZWUtZWxlY3Ryb25zLmNvbS9saW51eC92NS41LjIvc291cmNlL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3BjaS5oI0wzOQpbNF0gaHR0cHM6Ly9lbGl4aXIuZnJlZS1lbGVjdHJvbnMuY29tL2xpbnV4
L3Y1LjUuMi9zb3VyY2UvZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jI0w3ODkKWzVdIGh0dHBz
Oi8vZWxpeGlyLmZyZWUtZWxlY3Ryb25zLmNvbS9saW51eC92NS41LjIvc291cmNlL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvdm1kLmMjTDU0NwpbNl0gaHR0cHM6Ly9naXRodWIuY29tL2VuZGxlc3Nt
L2xpbnV4L2NvbW1pdC9lMThjZDI1NzMxMjJiODEzYWZmNGE0ZTI5ODZkYTVlYmVkZWEyNzA2I2Rp
ZmYtOTU0NThhNmM3N2FmOGUyNDg5YjZmZDA4MTUyODg4Y2ZSMjgzCls3XSBodHRwczovL2dpdGh1
Yi5jb20vZW5kbGVzc20vbGludXgvcHVsbC81MzQvY29tbWl0cy8xYTVmNTg0ZWIzNjJkOWIwMzY5
ZmFiOGEyMmVkMWM2ODM1NjVlNWVmCls4XSBodHRwczovL2VsaXhpci5mcmVlLWVsZWN0cm9ucy5j
b20vbGludXgvdjUuNS4yL3NvdXJjZS9kcml2ZXJzL2lvbW11L2ludGVsLWlvbW11LmMjTDc5NQpb
OV0gaHR0cHM6Ly9lbGl4aXIuZnJlZS1lbGVjdHJvbnMuY29tL2xpbnV4L3Y1LjUuMi9zb3VyY2Uv
ZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jI0wzNjU1CgpCZXN0IHJlZ2FyZHMsCkppYW4tSG9u
ZyBQYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9t
bXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
