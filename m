Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE43115AC7
	for <lists.iommu@lfdr.de>; Sat,  7 Dec 2019 03:41:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 77B1F204BB;
	Sat,  7 Dec 2019 02:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoA07B8qpPE2; Sat,  7 Dec 2019 02:41:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 64EFB204CD;
	Sat,  7 Dec 2019 02:41:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BB7BC077D;
	Sat,  7 Dec 2019 02:41:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53134C077D
 for <iommu@lists.linux-foundation.org>; Sat,  7 Dec 2019 02:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4908587818
 for <iommu@lists.linux-foundation.org>; Sat,  7 Dec 2019 02:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6ekRQ3C5AVn for <iommu@lists.linux-foundation.org>;
 Sat,  7 Dec 2019 02:41:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 54D5B877C2
 for <iommu@lists.linux-foundation.org>; Sat,  7 Dec 2019 02:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575686484;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDU7aadxuedUFHu/0gG2b6VpNLNOzLdFtAmUxKxfh1c=;
 b=RoiACQ9d5QGPrqOVto23hnekfQoq1EtHtuD/5CHT0eVEq2cARZis8lOxvgObsEEmXDBymG
 r4kfq7Oag5f5pH1WL2Nd1sHbfxfNSSBFS9/WygmHHz/nxKdu2N9U1mNsdbiwDQsre8PJeA
 IsFfE7gl1EvRpPEwfZ8uEYKXud/vwPc=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-bc0GmmA4MLSEUgAgKA4CbQ-1; Fri, 06 Dec 2019 21:41:21 -0500
Received: by mail-pf1-f198.google.com with SMTP id x26so5098243pfa.20
 for <iommu@lists.linux-foundation.org>; Fri, 06 Dec 2019 18:41:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=rgtaidxXmcmWfapnZboxCong7086+MqVKIrASm6uojQ=;
 b=hM+8yp2PbOUqtgkqPP479IDO+kjg8HpGvog3quQArHBvLYayyZK0UxLFnDilHcwlcO
 AaQWe8LI8NH5p8dzKOdw3cpfOMKheAot9CmMv0f57P4lzHmiwu4d8bE1QIx1pYf9hK99
 4QYV9VeSJPbFH87/Oq7PqYRUzFGgnC4wPj7CxltuFqDUA6e3hg+L4pTPws1WZfhEdvR5
 Zr3xg4ZWWYO+1dZD6bUISYlCZsYa+WesJax+eEYxhoAwy3ghTQcKAOO/RSEVnIU5xPaN
 cCsKEJZ/vZzmYKw66yjsAt4agfsZYfCoBwpPAT3Y4dKf+Xz/55NE1TLnCsUC9W5qpxFD
 Ocag==
X-Gm-Message-State: APjAAAXXwjLZJTP3Sh+OOMJ8hy+r8br/cKNDnb+GWrZ7MIXVQEYtaWcE
 0/tnzcP5/G3yTMTOz6Rkis/Yb4enfGJiIEsIyFouv4NbhFLCXUOe5X7ExZoRCqK12bjBqFpi0az
 jwIXxZyqxcN+Doz0vA/wccyt5Pt4Dxw==
X-Received: by 2002:a62:1e04:: with SMTP id e4mr17728861pfe.95.1575686480911; 
 Fri, 06 Dec 2019 18:41:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCqWUz+XOKQzhxbkaT9YGo9oxZSoMo29B+ra+4C3ReFekPPyA7A1Lgi3e47u6vvefaAWMp8Q==
X-Received: by 2002:a62:1e04:: with SMTP id e4mr17728839pfe.95.1575686480487; 
 Fri, 06 Dec 2019 18:41:20 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id q12sm12074617pfh.158.2019.12.06.18.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 18:41:19 -0800 (PST)
Date: Fri, 6 Dec 2019 19:41:18 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>
Subject: Re: dmar pte read access not set error messages on hp dl388 gen8
 systems
Message-ID: <20191207024118.uwwzthqifh2dca5q@cantor>
References: <5ce8d57e-25f0-5d28-7408-92c650ba54aa@linux.intel.com>
 <20191204205300.4jiexjqfpnqlcagu@cantor>
 <2d4e0c05-f0ee-d4b1-d2ed-24197811b097@linux.intel.com>
 <20191205022551.janpwjvr4kei5r7c@cantor>
 <d5981dee-d37b-a725-ed94-8864f3dd7602@linux.intel.com>
 <20191205025320.oiulo3msfcggdlv5@cantor>
 <d5fbedce-7a06-79b4-75fa-0aa3cc3ef73b@linux.intel.com>
 <20191206072453.5jjwrjedqbjimx45@cantor>
 <0f82007e-9887-d6b2-08e5-9c430c920b36@linux.intel.com>
 <20191207022914.7uccwkmgadz4hvbf@cantor>
MIME-Version: 1.0
In-Reply-To: <20191207022914.7uccwkmgadz4hvbf@cantor>
X-MC-Unique: bc0GmmA4MLSEUgAgKA4CbQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gRnJpIERlYyAwNiAxOSwgSmVycnkgU25pdHNlbGFhciB3cm90ZToKPk9uIFNhdCBEZWMgMDcg
MTksIEx1IEJhb2x1IHdyb3RlOgo+PkhpIEplcnJ5LAo+Pgo+Pk9uIDEyLzYvMTkgMzoyNCBQTSwg
SmVycnkgU25pdHNlbGFhciB3cm90ZToKPj4+T24gRnJpIERlYyAwNiAxOSwgTHUgQmFvbHUgd3Jv
dGU6Cj4+PltzbmlwXQo+Pj4+Cj4+Pj5DYW4geW91IHBsZWFzZSB0cnkgYmVsb3cgY2hhbmdlPyBM
ZXQncyBjaGVjayB3aGV0aGVyIHRoZSBhZmVuZGluZwo+Pj4+YWRkcmVzcyBoYXMgYmVlbiBtYXBw
ZWQgZm9yIGRldmljZSAwMS4wMC4yLgo+Pj4+Cj4+Pj4kIGdpdCBkaWZmCj4+Pj5kaWZmIC0tZ2l0
IGEvZHJpdmVycy9pb21tdS9pb21tdS5jIGIvZHJpdmVycy9pb21tdS9pb21tdS5jCj4+Pj5pbmRl
eCBkYjdiZmQ0ZjJkMjAuLmQ5ZGFmNjZiZTg0OSAxMDA2NDQKPj4+Pi0tLSBhL2RyaXZlcnMvaW9t
bXUvaW9tbXUuYwo+Pj4+KysrIGIvZHJpdmVycy9pb21tdS9pb21tdS5jCj4+Pj5AQCAtNjYzLDYg
KzY2Myw4IEBAIHN0YXRpYyBpbnQgCj4+Pj5pb21tdV9ncm91cF9jcmVhdGVfZGlyZWN0X21hcHBp
bmdzKHN0cnVjdCBpb21tdV9ncm91cCAqZ3JvdXAsCj4+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBpb21tdV9tYXAoZG9tYWluLCBhZGRyLCBhZGRy
LCAKPj4+PnBnX3NpemUsIGVudHJ5LT5wcm90KTsKPj4+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+Pj4rCj4+
Pj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8o
ZGV2LCAiU2V0dGluZyBpZGVudGl0eSBtYXAgCj4+Pj5bMHglTHggLSAweCVMeF0gZm9yIGdyb3Vw
ICVkXG4iLCBhZGRyLCBhZGRyICsgcGdfc2l6ZSwgCj4+Pj5ncm91cC0+aWQpOwo+Pj4+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4KPj4+PsKgwqDCoMKgwqDCoCB9Cj4+Pj4KPj4+
PkkgYW0gZG91YnRpbmcgdGhhdCBkZXZpY2UgMDEuMDAuMiBpcyBub3QgaW4gdGhlIGRldmljZSBz
Y29wZSBvZgo+Pj4+Cj4+Pj5bwqDCoMKgIDQuNDg1MTA4XSBETUFSOiBSTVJSIGJhc2U6IDB4MDAw
MDAwYmRmNmYwMDAgZW5kOiAweDAwMDAwMGJkZjdlZmZmCj4+Pj4KPj4+PkJ5IHRoZSB3YXksIGRv
ZXMgZGV2aWNlIDAxLjAwLjIgd29ya3Mgd2VsbCBhZnRlciBiaW5kaW5nIHRoZSBkcml2ZXI/Cj4+
Pj4KPj4+Cj4+PldoZW4gSSBib290IGl0IHdpdGggcGFzc3Rocm91Z2ggaXQgZG9lc24ndCBnZXQg
dG8gYSBwb2ludCB3aGVyZSBJIGNhbgo+Pj5sb2dpbi4gSSB0aGluayB0aGUgc2VyaWFsIGNvbnNv
bGUgb24gdGhlc2Ugc3lzdGVtcyBpcyB0aWVkIHRvIHRoZSBpbG8sCj4+PnNvIHRoZSBjb25zZXJ2
ZXIgY29ubmVjdGlvbiBjb3VsZCBiZSBtYWtpbmcgdGhpbmdzCj4+PndvcnNlLiBVbmZvcnR1bmF0
ZWx5IHRoZSBzeXN0ZW0gaXMgcmVtb3RlLiBJIHNob3VsZCBoYXZlIG1vcmUgdGltZSBub3cKPj4+
dG8gZm9jdXMgb24gZGVidWdnaW5nIHRoaXMuCj4+Pgo+Pj5BdHRhY2hpbmcgY29uc29sZSBvdXRw
dXQgZm9yIHRoZSBhYm92ZSBwYXRjaC4KPj4KPj5JdCBzZWVtcyB0aGF0IGRldmljZSAwMS4wMC4y
IGlzbid0IGluIHRoZSBzY29wZSBvZiBSTVJSIFtiYXNlOgo+PjB4MDAwMDAwYmRmNmYwMDAgZW5k
OiAweDAwMDAwMGJkZjdlZmZmXS4gQnV0IGl0IHN0aWxsIHRyaWVzIHRvIGFjY2Vzcwo+PnRoZSBh
ZGRyZXNzIHdpdGhpbiBpdCwgaGVuY2UgZmF1bHRzIGdlbmVyYXRlZC4KPj4KPj5Zb3UgY2FuIGNo
ZWNrIGl0IHdpdGggQUNQSS9ETUFSIHRhYmxlLgo+Pgo+PkJlc3QgcmVnYXJkcywKPj5iYW9sdQo+
Pgo+Cj5JIGJlbGlldmUgaXQgaXMgdGhlIDNyZCBlbmRwb2ludCBkZXZpY2UgZW50cnkgaW4gZG1h
ciBkYXRhIGJlbG93Lgo+U28gcXVlc3Rpb24gYWJvdXQgcmVxdWVzdF9kZWZhdWx0X2RvbWFpbl9m
b3JfZGV2LiBTaW5jZSBhIGRtYSBtYXBwaW5nCj5pcyBhbHJlYWR5IGRvbmUgZm9yIDEuMDAuMCwg
YW5kIHRoYXQgc2V0cyB0aGUgZGVmYXVsdF9kb21haW4gZm9yIHRoZQo+Z3JvdXAgKEkgdGhpbmsp
LCB3b24ndCBpdCBiYWlsIG91dCBmb3IgMS4wMC4yIGF0IHRoaXMgY2hlY2s/Cj4KPglpZiAoZ3Jv
dXAtPmRlZmF1bHRfZG9tYWluICYmIGdyb3VwLT5kZWZhdWx0X2RvbWFpbi0+dHlwZSA9PSB0eXBl
KQo+CQlnb3RvIG91dDsKPgoKT3IgSSBndWVzcyByZXF1ZXN0X2RlZmF1bHRfZG9tYWluX2Zvcl9k
ZXYgd291bGRuJ3QgZXZlbiBiZSBjYWxsZWQgZm9yIDEuMDAuMi4KaW50ZWxfaW9tbXVfYWRkX2Rl
dmljZSBpdCB3b3VsZG4ndCBldmVuIGNhbGwgb25lIG9mIHRoZSByZXF1ZXN0CmZ1bmN0aW9ucyB3
aXRoIDEuMDAuMiBzaW5jZSBkb21haW4tPnR5cGUgd291bGQgYmUgZG1hIGZyb20gMS4wMC4wLCBh
bmQgZGV2aWNlX2RlZl9kb21haW5fdHlwZQpzaG91bGQgcmV0dXJuIGRtYS4gCgo+Cj5vdXRwdXQg
ZnJvbSBsc3BjaSAtdDoKPgo+IFwtWzAwMDA6MDBdLSstMDAuMAo+ICAgICAgICAgICAgICstMDEu
MC1bMDhdLS0KPiAgICAgICAgICAgICArLTAxLjEtWzE0XS0tCj4gICAgICAgICAgICAgKy0wMi4w
LVswM10tLSstMDAuMAo+ICAgICAgICAgICAgIHwgICAgICAgICAgICArLTAwLjEKPiAgICAgICAg
ICAgICB8ICAgICAgICAgICAgKy0wMC4yCj4gICAgICAgICAgICAgfCAgICAgICAgICAgIFwtMDAu
Mwo+ICAgICAgICAgICAgICstMDIuMS1bMTVdLS0KPiAgICAgICAgICAgICArLTAyLjItWzAyXS0t
LS0wMC4wCj4gICAgICAgICAgICAgKy0wMi4zLVsxNl0tLQo+ICAgICAgICAgICAgICstMDMuMC1b
MDQtMDddLS0tLTAwLjAtWzA1LTA3XS0tKy0wMi4wLVswNl0tLSstMDAuMAo+ICAgICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgIFwtMDAuMQo+ICAg
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXC0wNC4wLVswN10tLSst
MDAuMAo+ICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwtMDAuMQo+ICAgICAgICAgICAgICstMDMuMS1bMTddLS0KPiAgICAgICAgICAgICAr
LTAzLjItWzE4XS0tCj4gICAgICAgICAgICAgKy0wMy4zLVsxOV0tLQo+ICAgICAgICAgICAgICst
MDQuMAo+ICAgICAgICAgICAgICstMDQuMQo+ICAgICAgICAgICAgICstMDQuMgo+ICAgICAgICAg
ICAgICstMDQuMwo+ICAgICAgICAgICAgICstMDQuNAo+ICAgICAgICAgICAgICstMDQuNQo+ICAg
ICAgICAgICAgICstMDQuNgo+ICAgICAgICAgICAgICstMDQuNwo+ICAgICAgICAgICAgICstMDUu
MAo+ICAgICAgICAgICAgICstMDUuMgo+ICAgICAgICAgICAgICstMDUuNAo+ICAgICAgICAgICAg
ICstMTEuMC1bMWJdLS0KPiAgICAgICAgICAgICArLTFhLjAKPiAgICAgICAgICAgICArLTFjLjAt
WzBiXS0tCj4gICAgICAgICAgICAgKy0xYy43LVswMV0tLSstMDAuMAo+ICAgICAgICAgICAgIHwg
ICAgICAgICAgICArLTAwLjEKPiAgICAgICAgICAgICB8ICAgICAgICAgICAgKy0wMC4yCj4gICAg
ICAgICAgICAgfCAgICAgICAgICAgIFwtMDAuNAo+ICAgICAgICAgICAgICstMWQuMAo+ICAgICAg
ICAgICAgICstMWUuMC1bMWFdLS0KPiAgICAgICAgICAgICArLTFmLjAKPiAgICAgICAgICAgICBc
LTFmLjIKPgo+RE1BUiB0YWJsZSBlbnRyaWVzIGZvciB0aGUgUk1SUjoKPgo+WzMwMmggMDc3MCAg
IDJdICAgICAgICAgICAgICAgIFN1YnRhYmxlIFR5cGUgOiAwMDAxIFtSZXNlcnZlZCBNZW1vcnkg
UmVnaW9uXQo+WzMwNGggMDc3MiAgIDJdICAgICAgICAgICAgICAgICAgICAgICBMZW5ndGggOiAw
MENFCj4KPlszMDZoIDA3NzQgICAyXSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAw
MAo+WzMwOGggMDc3NiAgIDJdICAgICAgICAgICBQQ0kgU2VnbWVudCBOdW1iZXIgOiAwMDAwCj5b
MzBBaCAwNzc4ICAgOF0gICAgICAgICAgICAgICAgIEJhc2UgQWRkcmVzcyA6IDAwMDAwMDAwQkRG
NkYwMDAKPlszMTJoIDA3ODYgICA4XSAgICAgICAgICBFbmQgQWRkcmVzcyAobGltaXQpIDogMDAw
MDAwMDBCREY3RUZGRgo+Cj5bMzFBaCAwNzk0ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUg
VHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQo+WzMxQmggMDc5NSAgIDFdICAgICAgICAg
ICAgICAgICBFbnRyeSBMZW5ndGggOiAwQQo+WzMxQ2ggMDc5NiAgIDJdICAgICAgICAgICAgICAg
ICAgICAgUmVzZXJ2ZWQgOiAwMDAwCj5bMzFFaCAwNzk4ICAgMV0gICAgICAgICAgICAgICBFbnVt
ZXJhdGlvbiBJRCA6IDAwCj5bMzFGaCAwNzk5ICAgMV0gICAgICAgICAgICAgICBQQ0kgQnVzIE51
bWJlciA6IDAwCj4KPlszMjBoIDA4MDAgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRo
IDogMDIsMDIKPgo+WzMyMmggMDgwMiAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGgg
OiAwMCwwMAo+Cj4KPlszMjRoIDA4MDQgICAxXSAgICAgICAgICAgIERldmljZSBTY29wZSBUeXBl
IDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdCj5bMzI1aCAwODA1ICAgMV0gICAgICAgICAgICAg
ICAgIEVudHJ5IExlbmd0aCA6IDBBCj5bMzI2aCAwODA2ICAgMl0gICAgICAgICAgICAgICAgICAg
ICBSZXNlcnZlZCA6IDAwMDAKPlszMjhoIDA4MDggICAxXSAgICAgICAgICAgICAgIEVudW1lcmF0
aW9uIElEIDogMDAKPlszMjloIDA4MDkgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVy
IDogMDAKPgo+WzMyQWggMDgxMCAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAx
QywwNwo+Cj5bMzJDaCAwODEyICAgMl0gICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDAw
LDAwCj4KPgo+WzMyRWggMDgxNCAgIDFdICAgICAgICAgICAgRGV2aWNlIFNjb3BlIFR5cGUgOiAw
MSBbUENJIEVuZHBvaW50IERldmljZV0KPlszMkZoIDA4MTUgICAxXSAgICAgICAgICAgICAgICAg
RW50cnkgTGVuZ3RoIDogMEEKPlszMzBoIDA4MTYgICAyXSAgICAgICAgICAgICAgICAgICAgIFJl
c2VydmVkIDogMDAwMAo+WzMzMmggMDgxOCAgIDFdICAgICAgICAgICAgICAgRW51bWVyYXRpb24g
SUQgOiAwMAo+WzMzM2ggMDgxOSAgIDFdICAgICAgICAgICAgICAgUENJIEJ1cyBOdW1iZXIgOiAw
MAo+Cj5bMzM0aCAwODIwICAgMl0gICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDFDLDA3
Cj4KPlszMzZoIDA4MjIgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDIK
Pgo+Cj5bMzM4aCAwODI0ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQ
Q0kgRW5kcG9pbnQgRGV2aWNlXQo+WzMzOWggMDgyNSAgIDFdICAgICAgICAgICAgICAgICBFbnRy
eSBMZW5ndGggOiAwOAo+WzMzQWggMDgyNiAgIDJdICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2
ZWQgOiAwMDAwCj5bMzNDaCAwODI4ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6
IDAwCj5bMzNEaCAwODI5ICAgMV0gICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDAwCj4K
PlszM0VoIDA4MzAgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMUYsMDIKPgo+
Cj5bMzQwaCAwODMyICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kg
RW5kcG9pbnQgRGV2aWNlXQo+WzM0MWggMDgzMyAgIDFdICAgICAgICAgICAgICAgICBFbnRyeSBM
ZW5ndGggOiAwOAo+WzM0MmggMDgzNCAgIDJdICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQg
OiAwMDAwCj5bMzQ0aCAwODM2ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAw
Cj5bMzQ1aCAwODM3ICAgMV0gICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDAwCj4KPlsz
NDZoIDA4MzggICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMUYsMDUKPgo+Cj5b
MzQ4aCAwODQwICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5k
cG9pbnQgRGV2aWNlXQo+WzM0OWggMDg0MSAgIDFdICAgICAgICAgICAgICAgICBFbnRyeSBMZW5n
dGggOiAwQQo+WzM0QWggMDg0MiAgIDJdICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgOiAw
MDAwCj5bMzRDaCAwODQ0ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwCj5b
MzREaCAwODQ1ICAgMV0gICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDAwCj4KPlszNEVo
IDA4NDYgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDAKPgo+WzM1MGgg
MDg0OCAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAwMCwwMAo+Cj4KPlszNTJo
IDA4NTAgICAxXSAgICAgICAgICAgIERldmljZSBTY29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2lu
dCBEZXZpY2VdCj5bMzUzaCAwODUxICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6
IDBBCj5bMzU0aCAwODUyICAgMl0gICAgICAgICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAwMDAK
PlszNTZoIDA4NTQgICAxXSAgICAgICAgICAgICAgIEVudW1lcmF0aW9uIElEIDogMDAKPlszNTdo
IDA4NTUgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKPgo+WzM1OGggMDg1
NiAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAwMiwwMAo+Cj5bMzVBaCAwODU4
ICAgMl0gICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDAwLDAxCj4KPgo+WzM1Q2ggMDg2
MCAgIDFdICAgICAgICAgICAgRGV2aWNlIFNjb3BlIFR5cGUgOiAwMSBbUENJIEVuZHBvaW50IERl
dmljZV0KPlszNURoIDA4NjEgICAxXSAgICAgICAgICAgICAgICAgRW50cnkgTGVuZ3RoIDogMEEK
PlszNUVoIDA4NjIgICAyXSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMAo+WzM2
MGggMDg2NCAgIDFdICAgICAgICAgICAgICAgRW51bWVyYXRpb24gSUQgOiAwMAo+WzM2MWggMDg2
NSAgIDFdICAgICAgICAgICAgICAgUENJIEJ1cyBOdW1iZXIgOiAwMAo+Cj5bMzYyaCAwODY2ICAg
Ml0gICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDAyLDAwCj4KPlszNjRoIDA4NjggICAy
XSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDIKPgo+Cj5bMzY2aCAwODcwICAg
MV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNl
XQo+WzM2N2ggMDg3MSAgIDFdICAgICAgICAgICAgICAgICBFbnRyeSBMZW5ndGggOiAwQQo+WzM2
OGggMDg3MiAgIDJdICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgOiAwMDAwCj5bMzZBaCAw
ODc0ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwCj5bMzZCaCAwODc1ICAg
MV0gICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDAwCj4KPlszNkNoIDA4NzYgICAyXSAg
ICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDAKPgo+WzM2RWggMDg3OCAgIDJdICAg
ICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAwMCwwMwo+Cj4KPlszNzBoIDA4ODAgICAxXSAg
ICAgICAgICAgIERldmljZSBTY29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdCj5b
MzcxaCAwODgxICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBFCj5bMzcyaCAw
ODgyICAgMl0gICAgICAgICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAwMDAKPlszNzRoIDA4ODQg
ICAxXSAgICAgICAgICAgICAgIEVudW1lcmF0aW9uIElEIDogMDAKPlszNzVoIDA4ODUgICAxXSAg
ICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKPgo+WzM3NmggMDg4NiAgIDJdICAgICAg
ICAgICAgICAgICAgICAgUENJIFBhdGggOiAwMywwMAo+Cj5bMzc4aCAwODg4ICAgMl0gICAgICAg
ICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDAwLDAwCj4KPlszN0FoIDA4OTAgICAyXSAgICAgICAg
ICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDAKPgo+WzM3Q2ggMDg5MiAgIDJdICAgICAgICAg
ICAgICAgICAgICAgUENJIFBhdGggOiAwMCwwMAo+Cj4KPlszN0VoIDA4OTQgICAxXSAgICAgICAg
ICAgIERldmljZSBTY29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdCj5bMzdGaCAw
ODk1ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBFCj5bMzgwaCAwODk2ICAg
Ml0gICAgICAgICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAwMDAKPlszODJoIDA4OTggICAxXSAg
ICAgICAgICAgICAgIEVudW1lcmF0aW9uIElEIDogMDAKPlszODNoIDA4OTkgICAxXSAgICAgICAg
ICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKPgo+WzM4NGggMDkwMCAgIDJdICAgICAgICAgICAg
ICAgICAgICAgUENJIFBhdGggOiAwMywwMAo+Cj5bMzg2aCAwOTAyICAgMl0gICAgICAgICAgICAg
ICAgICAgICBQQ0kgUGF0aCA6IDAwLDAwCj4KPlszODhoIDA5MDQgICAyXSAgICAgICAgICAgICAg
ICAgICAgIFBDSSBQYXRoIDogMDIsMDAKPgo+WzM4QWggMDkwNiAgIDJdICAgICAgICAgICAgICAg
ICAgICAgUENJIFBhdGggOiAwMCwwMQo+Cj4KPlszOENoIDA5MDggICAxXSAgICAgICAgICAgIERl
dmljZSBTY29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdCj5bMzhEaCAwOTA5ICAg
MV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBFCj5bMzhFaCAwOTEwICAgMl0gICAg
ICAgICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAwMDAKPlszOTBoIDA5MTIgICAxXSAgICAgICAg
ICAgICAgIEVudW1lcmF0aW9uIElEIDogMDAKPlszOTFoIDA5MTMgICAxXSAgICAgICAgICAgICAg
IFBDSSBCdXMgTnVtYmVyIDogMDAKPgo+WzM5MmggMDkxNCAgIDJdICAgICAgICAgICAgICAgICAg
ICAgUENJIFBhdGggOiAwMywwMAo+Cj5bMzk0aCAwOTE2ICAgMl0gICAgICAgICAgICAgICAgICAg
ICBQQ0kgUGF0aCA6IDAwLDAwCj4KPlszOTZoIDA5MTggICAyXSAgICAgICAgICAgICAgICAgICAg
IFBDSSBQYXRoIDogMDQsMDAKPgo+WzM5OGggMDkyMCAgIDJdICAgICAgICAgICAgICAgICAgICAg
UENJIFBhdGggOiAwMCwwMAo+Cj4KPlszOUFoIDA5MjIgICAxXSAgICAgICAgICAgIERldmljZSBT
Y29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdCj5bMzlCaCAwOTIzICAgMV0gICAg
ICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBFCj5bMzlDaCAwOTI0ICAgMl0gICAgICAgICAg
ICAgICAgICAgICBSZXNlcnZlZCA6IDAwMDAKPlszOUVoIDA5MjYgICAxXSAgICAgICAgICAgICAg
IEVudW1lcmF0aW9uIElEIDogMDAKPlszOUZoIDA5MjcgICAxXSAgICAgICAgICAgICAgIFBDSSBC
dXMgTnVtYmVyIDogMDAKPgo+WzNBMGggMDkyOCAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJ
IFBhdGggOiAwMywwMAo+Cj5bM0EyaCAwOTMwICAgMl0gICAgICAgICAgICAgICAgICAgICBQQ0kg
UGF0aCA6IDAwLDAwCj4KPlszQTRoIDA5MzIgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQ
YXRoIDogMDQsMDAKPgo+WzNBNmggMDkzNCAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBh
dGggOiAwMCwwMQo+Cj4KPlszQThoIDA5MzYgICAxXSAgICAgICAgICAgIERldmljZSBTY29wZSBU
eXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdCj5bM0E5aCAwOTM3ICAgMV0gICAgICAgICAg
ICAgICAgIEVudHJ5IExlbmd0aCA6IDBBCj5bM0FBaCAwOTM4ICAgMl0gICAgICAgICAgICAgICAg
ICAgICBSZXNlcnZlZCA6IDAwMDAKPlszQUNoIDA5NDAgICAxXSAgICAgICAgICAgICAgIEVudW1l
cmF0aW9uIElEIDogMDAKPlszQURoIDA5NDEgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVt
YmVyIDogMjAKPgo+WzNBRWggMDk0MiAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGgg
OiAwMiwwMgo+Cj5bM0IwaCAwOTQ0ICAgMl0gICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6
IDAwLDAwCj4KPgo+WzNCMmggMDk0NiAgIDFdICAgICAgICAgICAgRGV2aWNlIFNjb3BlIFR5cGUg
OiAwMSBbUENJIEVuZHBvaW50IERldmljZV0KPlszQjNoIDA5NDcgICAxXSAgICAgICAgICAgICAg
ICAgRW50cnkgTGVuZ3RoIDogMEEKPlszQjRoIDA5NDggICAyXSAgICAgICAgICAgICAgICAgICAg
IFJlc2VydmVkIDogMDAwMAo+WzNCNmggMDk1MCAgIDFdICAgICAgICAgICAgICAgRW51bWVyYXRp
b24gSUQgOiAwMAo+WzNCN2ggMDk1MSAgIDFdICAgICAgICAgICAgICAgUENJIEJ1cyBOdW1iZXIg
OiAyMAo+Cj5bM0I4aCAwOTUyICAgMl0gICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDAy
LDAyCj4KPlszQkFoIDA5NTQgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAs
MDEKPgo+Cj5bM0JDaCAwOTU2ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAx
IFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQo+WzNCRGggMDk1NyAgIDFdICAgICAgICAgICAgICAgICBF
bnRyeSBMZW5ndGggOiAwQQo+WzNCRWggMDk1OCAgIDJdICAgICAgICAgICAgICAgICAgICAgUmVz
ZXJ2ZWQgOiAwMDAwCj5bM0MwaCAwOTYwICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJ
RCA6IDAwCj5bM0MxaCAwOTYxICAgMV0gICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDIw
Cj4KPlszQzJoIDA5NjIgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDIK
Pgo+WzNDNGggMDk2NCAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAwMCwwMgo+
Cj4KPlszQzZoIDA5NjYgICAxXSAgICAgICAgICAgIERldmljZSBTY29wZSBUeXBlIDogMDEgW1BD
SSBFbmRwb2ludCBEZXZpY2VdCj5bM0M3aCAwOTY3ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5
IExlbmd0aCA6IDBBCj5bM0M4aCAwOTY4ICAgMl0gICAgICAgICAgICAgICAgICAgICBSZXNlcnZl
ZCA6IDAwMDAKPlszQ0FoIDA5NzAgICAxXSAgICAgICAgICAgICAgIEVudW1lcmF0aW9uIElEIDog
MDAKPlszQ0JoIDA5NzEgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMjAKPgo+
WzNDQ2ggMDk3MiAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAwMiwwMgo+Cj5b
M0NFaCAwOTc0ICAgMl0gICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDAwLDAzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5n
IGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
