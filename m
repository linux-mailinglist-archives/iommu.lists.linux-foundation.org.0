Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1BC117E87
	for <lists.iommu@lfdr.de>; Tue, 10 Dec 2019 04:48:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DE5E420006;
	Tue, 10 Dec 2019 03:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1xGw-cFw6-N; Tue, 10 Dec 2019 03:48:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 972B020430;
	Tue, 10 Dec 2019 03:48:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B299C1D83;
	Tue, 10 Dec 2019 03:48:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 582FDC0881
 for <iommu@lists.linux-foundation.org>; Tue, 10 Dec 2019 03:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B59CD2041C
 for <iommu@lists.linux-foundation.org>; Tue, 10 Dec 2019 03:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sc49lm8yzcUV for <iommu@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 03:48:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 77AD820006
 for <iommu@lists.linux-foundation.org>; Tue, 10 Dec 2019 03:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575949679;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFSLg9bFjSuk01in6M0otnoospF1Dv/l5jzBs0YBIzc=;
 b=QoeZFC8Kxr2X4/Xm/CdsqSncbDZPX15/8u6B7L4fnmhCfJ/Plv3d33n5Gf1NxVG52yrgHT
 QU5u7V/G2gTO1RAZmFHTkIm2jtk/KzUlUOp+uL95jqD/8+sc45T17BuxlpW/gblN5DG36B
 BuGxksLKZSB2KiH9Y0DxQcyCG9LP4lM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-AXaQ_OgkMqK_WHsR_6dhXw-1; Mon, 09 Dec 2019 22:47:57 -0500
Received: by mail-yb1-f197.google.com with SMTP id v186so869277ybc.4
 for <iommu@lists.linux-foundation.org>; Mon, 09 Dec 2019 19:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=SgmyUmCFJPcbQIAgqEp5TcBgxGJxIEaQY8xaleg7zBE=;
 b=SYHeuPBZCkPsdvD2kcc5WEwQmieEb/7OO9wTe/f7fHxHnDscUVex2RNB7hfU380Kj3
 emlK/hEK8A6gLAY1KFyvepsPiSLbYCpV5uxmMwKi3vcwIw2XkQI9bFT1nbAqv3N1QIrk
 R2ZGnJORRHn7WWblpm8UXu80P6NLWtSeAOHjG+6SB7hfFmFLkMj+wAZdTGG3NvB4RohH
 p9v5l+vZIt2ILrEnNEdIqUiNqurUlkz1dPiAng0Z035eQWbRLBu6f3D4L1AYR8RChjjx
 I7BVeA9BfnIU83VHEx04KweRxMll/YKbTQviimQMIdxWfzCoZ0GsfwCtPvxky6GvBVdi
 D/iw==
X-Gm-Message-State: APjAAAUF2xlIY5FBPVPGF3yYFk0nYK74gQSJtO2sZ+Ry96x+YN/kIWRb
 NJDwib6qZhdPCwaRWt1u+D92olZ85YddAfPttkzloy7EEibNKuIGNYNBFyqWX1df2CybTJRKUlS
 DS7S2VlkysLTUS8EbKp9QCEzjltb5Eg==
X-Received: by 2002:a25:d652:: with SMTP id n79mr1017076ybg.341.1575949676593; 
 Mon, 09 Dec 2019 19:47:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqy3rKCStK8cZnpQfWuK+lrhmkGRmpvqC9wh/IUILyeDHSEbVttG88XCl0p4ITT8yI3J67aI1A==
X-Received: by 2002:a25:d652:: with SMTP id n79mr1017066ybg.341.1575949676165; 
 Mon, 09 Dec 2019 19:47:56 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id d207sm944523ywa.62.2019.12.09.19.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 19:47:55 -0800 (PST)
Date: Mon, 9 Dec 2019 20:47:53 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: dmar pte read access not set error messages on hp dl388 gen8
 systems
Message-ID: <20191210034753.wlmbqdvqpcnzfxyl@cantor>
References: <d5981dee-d37b-a725-ed94-8864f3dd7602@linux.intel.com>
 <20191205025320.oiulo3msfcggdlv5@cantor>
 <d5fbedce-7a06-79b4-75fa-0aa3cc3ef73b@linux.intel.com>
 <20191206072453.5jjwrjedqbjimx45@cantor>
 <0f82007e-9887-d6b2-08e5-9c430c920b36@linux.intel.com>
 <20191207022914.7uccwkmgadz4hvbf@cantor>
 <20191207024118.uwwzthqifh2dca5q@cantor>
 <7979b838-e2c5-4064-490c-8e0884909715@linux.intel.com>
 <20191210005234.kanygdcjgsgo7z6j@cantor>
 <77d3ca8e-cb8c-4392-fa99-c55daa263b8e@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <77d3ca8e-cb8c-4392-fa99-c55daa263b8e@linux.intel.com>
X-MC-Unique: AXaQ_OgkMqK_WHsR_6dhXw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: iommu@lists.linux-foundation.org
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

T24gVHVlIERlYyAxMCAxOSwgTHUgQmFvbHUgd3JvdGU6Cj5IaSwKPgo+T24gMTIvMTAvMTkgODo1
MiBBTSwgSmVycnkgU25pdHNlbGFhciB3cm90ZToKPj5PbiBTdW4gRGVjIDA4IDE5LCBMdSBCYW9s
dSB3cm90ZToKPj4+SGksCj4+Pgo+Pj5PbiAxMi83LzE5IDEwOjQxIEFNLCBKZXJyeSBTbml0c2Vs
YWFyIHdyb3RlOgo+Pj4+T24gRnJpIERlYyAwNiAxOSwgSmVycnkgU25pdHNlbGFhciB3cm90ZToK
Pj4+Pj5PbiBTYXQgRGVjIDA3IDE5LCBMdSBCYW9sdSB3cm90ZToKPj4+Pj4+SGkgSmVycnksCj4+
Pj4+Pgo+Pj4+Pj5PbiAxMi82LzE5IDM6MjQgUE0sIEplcnJ5IFNuaXRzZWxhYXIgd3JvdGU6Cj4+
Pj4+Pj5PbiBGcmkgRGVjIDA2IDE5LCBMdSBCYW9sdSB3cm90ZToKPj4+Pj4+PltzbmlwXQo+Pj4+
Pj4+Pgo+Pj4+Pj4+PkNhbiB5b3UgcGxlYXNlIHRyeSBiZWxvdyBjaGFuZ2U/IExldCdzIGNoZWNr
IHdoZXRoZXIgdGhlIGFmZW5kaW5nCj4+Pj4+Pj4+YWRkcmVzcyBoYXMgYmVlbiBtYXBwZWQgZm9y
IGRldmljZSAwMS4wMC4yLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiQgZ2l0IGRpZmYKPj4+Pj4+Pj5kaWZm
IC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pb21tdS5jIGIvZHJpdmVycy9pb21tdS9pb21tdS5jCj4+
Pj4+Pj4+aW5kZXggZGI3YmZkNGYyZDIwLi5kOWRhZjY2YmU4NDkgMTAwNjQ0Cj4+Pj4+Pj4+LS0t
IGEvZHJpdmVycy9pb21tdS9pb21tdS5jCj4+Pj4+Pj4+KysrIGIvZHJpdmVycy9pb21tdS9pb21t
dS5jCj4+Pj4+Pj4+QEAgLTY2Myw2ICs2NjMsOCBAQCBzdGF0aWMgaW50IAo+Pj4+Pj4+PmlvbW11
X2dyb3VwX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3Moc3RydWN0IGlvbW11X2dyb3VwIAo+Pj4+Pj4+
Pipncm91cCwKPj4+Pj4+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXQgPSBpb21tdV9tYXAoZG9tYWluLCBhZGRyLCAKPj4+Pj4+Pj5hZGRyLCBwZ19zaXpl
LCBlbnRyeS0+cHJvdCk7Cj4+Pj4+Pj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+Pj4+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+Pj4+Pj4+Kwo+Pj4+
Pj4+PivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfaW5m
byhkZXYsICJTZXR0aW5nIGlkZW50aXR5IAo+Pj4+Pj4+Pm1hcCBbMHglTHggLSAweCVMeF0gZm9y
IGdyb3VwICVkXG4iLCBhZGRyLCBhZGRyICsgCj4+Pj4+Pj4+cGdfc2l6ZSwgZ3JvdXAtPmlkKTsK
Pj4+Pj4+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+Pj4KPj4+Pj4+Pj7C
oMKgwqDCoMKgwqAgfQo+Pj4+Pj4+Pgo+Pj4+Pj4+PkkgYW0gZG91YnRpbmcgdGhhdCBkZXZpY2Ug
MDEuMDAuMiBpcyBub3QgaW4gdGhlIGRldmljZSBzY29wZSBvZgo+Pj4+Pj4+Pgo+Pj4+Pj4+PlvC
oMKgwqAgNC40ODUxMDhdIERNQVI6IFJNUlIgYmFzZTogMHgwMDAwMDBiZGY2ZjAwMCBlbmQ6IAo+
Pj4+Pj4+PjB4MDAwMDAwYmRmN2VmZmYKPj4+Pj4+Pj4KPj4+Pj4+Pj5CeSB0aGUgd2F5LCBkb2Vz
IGRldmljZSAwMS4wMC4yIHdvcmtzIHdlbGwgYWZ0ZXIgYmluZGluZyB0aGUgZHJpdmVyPwo+Pj4+
Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj5XaGVuIEkgYm9vdCBpdCB3aXRoIHBhc3N0aHJvdWdoIGl0IGRv
ZXNuJ3QgZ2V0IHRvIGEgcG9pbnQgd2hlcmUgSSBjYW4KPj4+Pj4+PmxvZ2luLiBJIHRoaW5rIHRo
ZSBzZXJpYWwgY29uc29sZSBvbiB0aGVzZSBzeXN0ZW1zIGlzIHRpZWQgCj4+Pj4+Pj50byB0aGUg
aWxvLAo+Pj4+Pj4+c28gdGhlIGNvbnNlcnZlciBjb25uZWN0aW9uIGNvdWxkIGJlIG1ha2luZyB0
aGluZ3MKPj4+Pj4+PndvcnNlLiBVbmZvcnR1bmF0ZWx5IHRoZSBzeXN0ZW0gaXMgcmVtb3RlLiBJ
IHNob3VsZCBoYXZlIAo+Pj4+Pj4+bW9yZSB0aW1lIG5vdwo+Pj4+Pj4+dG8gZm9jdXMgb24gZGVi
dWdnaW5nIHRoaXMuCj4+Pj4+Pj4KPj4+Pj4+PkF0dGFjaGluZyBjb25zb2xlIG91dHB1dCBmb3Ig
dGhlIGFib3ZlIHBhdGNoLgo+Pj4+Pj4KPj4+Pj4+SXQgc2VlbXMgdGhhdCBkZXZpY2UgMDEuMDAu
MiBpc24ndCBpbiB0aGUgc2NvcGUgb2YgUk1SUiBbYmFzZToKPj4+Pj4+MHgwMDAwMDBiZGY2ZjAw
MCBlbmQ6IDB4MDAwMDAwYmRmN2VmZmZdLiBCdXQgaXQgc3RpbGwgdHJpZXMgdG8gYWNjZXNzCj4+
Pj4+PnRoZSBhZGRyZXNzIHdpdGhpbiBpdCwgaGVuY2UgZmF1bHRzIGdlbmVyYXRlZC4KPj4+Pj4+
Cj4+Pj4+PllvdSBjYW4gY2hlY2sgaXQgd2l0aCBBQ1BJL0RNQVIgdGFibGUuCj4+Pj4+Pgo+Pj4+
Pj5CZXN0IHJlZ2FyZHMsCj4+Pj4+PmJhb2x1Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PkkgYmVsaWV2ZSBp
dCBpcyB0aGUgM3JkIGVuZHBvaW50IGRldmljZSBlbnRyeSBpbiBkbWFyIGRhdGEgYmVsb3cuCj4+
Pj4+U28gcXVlc3Rpb24gYWJvdXQgcmVxdWVzdF9kZWZhdWx0X2RvbWFpbl9mb3JfZGV2LiBTaW5j
ZSBhIGRtYSBtYXBwaW5nCj4+Pj4+aXMgYWxyZWFkeSBkb25lIGZvciAxLjAwLjAsIGFuZCB0aGF0
IHNldHMgdGhlIGRlZmF1bHRfZG9tYWluIGZvciB0aGUKPj4+Pj5ncm91cCAoSSB0aGluayksIHdv
bid0IGl0IGJhaWwgb3V0IGZvciAxLjAwLjIgYXQgdGhpcyBjaGVjaz8KPj4+Pj4KPj4+Pj7CoMKg
wqDCoGlmIChncm91cC0+ZGVmYXVsdF9kb21haW4gJiYgZ3JvdXAtPmRlZmF1bHRfZG9tYWluLT50
eXBlID09IHR5cGUpCj4+Pj4+wqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+Pj4+Cj4+Pj4KPj4+
Pk9yIEkgZ3Vlc3MgcmVxdWVzdF9kZWZhdWx0X2RvbWFpbl9mb3JfZGV2IHdvdWxkbid0IGV2ZW4g
YmUgCj4+Pj5jYWxsZWQgZm9yIDEuMDAuMi4KPj4+PmludGVsX2lvbW11X2FkZF9kZXZpY2UgaXQg
d291bGRuJ3QgZXZlbiBjYWxsIG9uZSBvZiB0aGUgcmVxdWVzdAo+Pj4+ZnVuY3Rpb25zIHdpdGgg
MS4wMC4yIHNpbmNlIGRvbWFpbi0+dHlwZSB3b3VsZCBiZSBkbWEgZnJvbSAKPj4+PjEuMDAuMCwg
YW5kIGRldmljZV9kZWZfZG9tYWluX3R5cGUKPj4+PnNob3VsZCByZXR1cm4gZG1hLgo+Pj4KPj4+
Q2FuIHlvdSBwbGVhc2UgYWRkIHNvbWUgZGVidWcgbWVzc2FnZXMgYW5kIGNoZWNrIHdoYXQgcmVh
bGx5IGhhcHBlbnMKPj4+aGVyZT8KPj4+Cj4+PkJlc3QgcmVnYXJkcywKPj4+YmFvbHUKPj4+Cj4+
Cj4+W8KgwqAgMjUuMDAwNTQ0XSBwY2kgMDAwMDowMTowMC4wOiBBZGRpbmcgdG8gaW9tbXUgZ3Jv
dXAgMjUKPj5bwqDCoCAyNS41MDIyNDNdIHBjaSAwMDAwOjAxOjAwLjA6IERNQVI6IGRvbWFpbi0+
dHlwZSBpcyBpZGVudGl0ecKgIDw8IAo+PmludGVsX2lvbW11X2FkZF9kZXZpY2UgKGFsbG9jZWQg
aW4gaW9tbXVfZ3JvdXBfZ2V0X2Zvcl9kZXYpCj4+W8KgwqAgMjUuNTA0MjM5XSBwY2kgMDAwMDow
MTowMC4wOiBETUFSOiBkZXZpY2UgZGVmYXVsdCBkb21haW4gdHlwZSBpcyAKPj5kbWEuIHJlcXVl
c3RpbmcgZG1hIGRvbWFpbsKgIDw8IGludGVsX2lvbW11X2FkZF9kZXZpY2UKPj5bwqDCoCAyNS41
MDc5NTRdIHBjaSAwMDAwOjAxOjAwLjA6IFVzaW5nIGlvbW11IGRtYSBtYXBwaW5nwqDCoMKgIDw8
IAo+PnJlcXVlc3RfZGVmYXVsdF9kb21haW5fZm9yX2RldsKgIChub3cgZGVmYXVsdCBkb21haW4g
Zm9yIGdyb3VwIGlzIAo+PmRtYSkKPj5bwqDCoCAyNS41MDk3NjVdIHBjaSAwMDAwOjAxOjAwLjE6
IEFkZGluZyB0byBpb21tdSBncm91cCAyNQo+PlvCoMKgIDI1LjUxMTUxNF0gcGNpIDAwMDA6MDE6
MDAuMTogRE1BUjogZG9tYWluLT50eXBlIGlzIGRtYcKgIDw8IAo+PmludGVsX2lvbW11X2FkZF9k
ZXZpY2UKPj5bwqDCoCAyNS41MTMyNjNdIHBjaSAwMDAwOjAxOjAwLjE6IERNQVI6IGRldmljZSBk
ZWZhdWx0IGRvbWFpbiB0eXBlIGlzIAo+PmlkZW50aXR5LiByZXF1ZXN0aW5nIGlkZW50aXR5IGRv
bWFpbsKgIDw8IGludGVsX2lvbW11X2FkZF9kZXZpY2UKPj5bwqDCoCAyNS41MTY0MzVdIHBjaSAw
MDAwOjAxOjAwLjE6IGRvbid0IGNoYW5nZSBtYXBwaW5ncyBvZiBleGlzdGluZyAKPj5kZXZpY2Vz
LsKgwqDCoCA8PCByZXF1ZXN0X2RlZmF1bHRfZG9tYWluX2Zvcl9kZXYKPj5bwqDCoCAyNS41MTg2
NjldIHBjaSAwMDAwOjAxOjAwLjE6IERNQVI6IERldmljZSB1c2VzIGEgcHJpdmF0ZSAKPj5pZGVu
dGl0eSBkb21haW4uwqAgPDwgaW50ZWxfaW9tbXVfYWRkX2RldmljZQo+PlvCoMKgIDI1LjUyMTA2
MV0gcGNpIDAwMDA6MDE6MDAuMjogQWRkaW5nIHRvIGlvbW11IGdyb3VwIDI1Cj4+W8KgwqAgMjUu
NTIyNzkxXSBwY2kgMDAwMDowMTowMC4yOiBETUFSOiBkb21haW4tPnR5cGUgaXMgZG1hwqAgPDwg
Cj4+aW50ZWxfaW9tbXVfYWRkX2RldmljZQo+PlvCoMKgIDI1LjUyNDcwNl0gcGNpIDAwMDA6MDE6
MDAuNDogQWRkaW5nIHRvIGlvbW11IGdyb3VwIDI1Cj4+W8KgwqAgMjUuNTI2NDU4XSBwY2kgMDAw
MDowMTowMC40OiBETUFSOiBkb21haW4tPnR5cGUgaXMgZG1hwqAgPDwgCj4+aW50ZWxfaW9tbXVf
YWRkX2RldmljZQo+PlvCoMKgIDI1LjUyODIxM10gcGNpIDAwMDA6MDE6MDAuNDogRE1BUjogZGV2
aWNlIGRlZmF1bHQgZG9tYWluIHR5cGUgaXMgCj4+aWRlbnRpdHkuIHJlcXVlc3RpbmcgaWRlbnRp
dHkgZG9tYWluwqAgPDwgaW50ZWxfaW9tbXVfYWRkX2RldmljZQo+PlvCoMKgIDI1LjUzMTI4NF0g
cGNpIDAwMDA6MDE6MDAuNDogZG9uJ3QgY2hhbmdlIG1hcHBpbmdzIG9mIGV4aXN0aW5nIAo+PmRl
dmljZXMuwqDCoMKgIDw8IHJlcXVlc3RfZGVmYXVsdF9kb21haW5fZm9yX2Rldgo+PlvCoMKgIDI1
LjUzMzUwMF0gcGNpIDAwMDA6MDE6MDAuNDogRE1BUjogRGV2aWNlIHVzZXMgYSBwcml2YXRlIAo+
PmlkZW50aXR5IGRvbWFpbi7CoCA8PCBpbnRlbF9pb21tdV9hZGRfZGV2aWNlCj4+Cj4+U28gdGhl
IGRvbWFpbiB0eXBlIGlzIGRtYSBhZnRlciAwMTowMC4wIGdldHMgYWRkZWQsIGFuZCB3aGVuCj4+
aW50ZWxfaW9tbXVfYWRkX2RldmljZSBpcyBjYWxsZWQgZm9yIDAxOjAwLjIgaXQgd2lsbCBnbyBp
bnRvIHRoZSBpZgo+PnNlY3Rpb24uIFNpbmNlIHRoZSBkZXZpY2UgZGVmYXVsdCBkb21haW4gdHlw
ZSBmb3IgMDE6MDAuMiBpcyBkbWEKPj5ub3RoaW5nIGhhcHBlbnMgaW4gdGhlcmUsIGFuZCBpdCBn
b2VzIG9uIHRvIDAxOjAwLjQuIElzIHRoZSAicHJpdmF0ZQo+PmlkZW50aXR5IGRvbWFpbiIgbWVz
c2FnZSByZWFsbHkgYWNjdXJhdGUgc2luY2UgZXZlcnlvbmUgd2lsbCB1c2UKPj5zaV9kb21haW4/
IEFkZGluZyBzb21lIG1vcmUgZGVidWdnaW5nLgo+Cj5UaGUgZmFjdHMgdGhhdCB3ZSBoYXZlIHNl
ZW46Cj4KPjEpIDAxLjAwLjIgdXNlcyB0aGUgZGVmYXVsdCBkb21haW4gaW4gZ3JvdXAgMjUuIFRo
ZSBkb21haW4gdHlwZSBvZiB0aGlzCj4gICBkZWZhdWx0IGRvbWFpbiBpcyBETUEuCj4KPjIpIGlv
bW11X2dyb3VwX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3MoKSAqc2hvdWxkKiBiZSBjYWxsZWQgd2hl
biBhZGRpbmcKPiAgIDAxLjAwLjIgaW50byBncm91cCAyNS4gQXMgdGhlIHJlc3VsdCwgUk1SUiBm
b3IgdGhpcyBkZXZpY2UgKnNob3VsZCoKPiAgIGJlIGlkZW50aXR5IG1hcHBlZC4KPgo+MykgQnkg
Y2hlY2tpbmcgRE1BUiB0YWJsZSwgUk1SUiAoMHgwMDAwMDBiZGY2ZjAwMCB+IDB4MDAwMDAwYmRm
N2VmZmYpIGlzCj4gICByZXBvcnRlZCBmb3IgZGV2aWNlIDAxLjAwLjIuCj4KPlRoZSBwcm9ibGVt
IGlzIHRoYXQgUk1SUiAoMHgwMDAwMDBiZGY2ZjAwMCB+IDB4MDAwMDAwYmRmN2VmZmYpIGhhc24n
dAo+YWN0dWFsbHkgYmVlbiBtYXBwZWQsIGFzIHRoZSByZXN1bHQgSU9NTVUgZmF1bHRzIGdlbmVy
YXRlZCB3aGVuIGRldmljZQo+dHJ5IHRvIGFjY2VzcyB0aGlzIHJhbmdlLgo+Cj5TbyBJIGd1ZXNz
IHlvdSBjb3VsZCBhZGQgbW9yZSBkZWJ1ZyBtZXNzYWdlIHRvIGNoZWNrIHdoeQo+aW9tbXVfZ3Jv
dXBfY3JlYXRlX2RpcmVjdF9tYXBwaW5ncygpIGRvZXNuJ3QgZG8gdGhlIHJpZ2h0IHRoaW5nPwo+
Cj5CZXN0IHJlZ2FyZHMsCj5iYW9sdQo+CgpBIGNhbGwgdG8gaW9tbXVfbWFwIGlzIGZhaWxpbmcu
CgpbICAgMzYuNjg2ODgxXSBwY2kgMDAwMDowMTowMC4yOiBpb21tdV9ncm91cF9hZGRfZGV2aWNl
OiBjYWxsaW5nIGlvbW11X2dyb3VwX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3MKWyAgIDM2LjY4OTg0
M10gcGNpIDAwMDA6MDE6MDAuMjogaW9tbXVfZ3JvdXBfY3JlYXRlX2RpcmVjdF9tYXBwaW5nczog
aXRlcmF0aW5nIHRocm91Z2ggbWFwcGluZ3MKWyAgIDM2LjY5Mjc1N10gcGNpIDAwMDA6MDE6MDAu
MjogaW9tbXVfZ3JvdXBfY3JlYXRlX2RpcmVjdF9tYXBwaW5nczogY2FsbGluZyBhcHBseV9yZXN2
X3JlZ2lvbgpbICAgMzYuNjk1NTI2XSBwY2kgMDAwMDowMTowMC4yOiBlX2RpcmVjdF9tYXBwaW5n
czogZW50cnkgdHlwZSBpcyBkaXJlY3QKWyAgIDM3LjE5ODA1M10gaW9tbXU6IGlvbW11X21hcDog
b3BzLT5tYXAgZmFpbGVkIGlvdmEgMHhiZGRkZTAwMCBwYSAweDAwMDAwMDAwYmRkZGUwMDAgcGdz
aXplIDB4MTAwMApbICAgMzcuMjAxMzU3XSBwY2kgMDAwMDowMTowMC4yOiBpb21tdV9ncm91cF9j
cmVhdGVfZGlyZWN0X21hcHBpbmdzOiBpb21tdV9tYXAgZmFpbGVkClsgICAzNy4yMDM5NzNdIHBj
aSAwMDAwOjAxOjAwLjI6IGlvbW11X2dyb3VwX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3M6IGxlYXZp
bmcgZnVuYwpbICAgMzcuMjA2Mzg1XSBwY2kgMDAwMDowMTowMC4yOiBpb21tdV9ncm91cF9hZGRf
ZGV2aWNlOiBjYWxsaW5nIF9faW9tbXVfYXR0YWNoX2RldmljZQpbICAgMzcuMjA4OTUwXSBwY2kg
MDAwMDowMTowMC4yOiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAgMjUKWyAgIDM3LjIxMDY2MF0gcGNp
IDAwMDA6MDE6MDAuMjogRE1BUjogZG9tYWluLT50eXBlIGlzIGRtYQoKQWxzbyBmYWlscyBmb3Ig
MDE6MDAuNDoKClsgICAzNy4yMTI0NDhdIHBjaSAwMDAwOjAxOjAwLjQ6IGlvbW11X2dyb3VwX2Fk
ZF9kZXZpY2U6IGNhbGxpbmcgaW9tbXVfZ3JvdXBfY3JlYXRlX2RpcmVjdF9tYXBwaW5ncwpbICAg
MzcuMjE1MzgyXSBwY2kgMDAwMDowMTowMC40OiBpb21tdV9ncm91cF9jcmVhdGVfZGlyZWN0X21h
cHBpbmdzOiBpdGVyYXRpbmcgdGhyb3VnaCBtYXBwaW5ncwpbICAgMzcuMjE4MTcwXSBwY2kgMDAw
MDowMTowMC40OiBpb21tdV9ncm91cF9jcmVhdGVfZGlyZWN0X21hcHBpbmdzOiBjYWxsaW5nIGFw
cGx5X3Jlc3ZfcmVnaW9uClsgICAzNy4yMjA5MzNdIHBjaSAwMDAwOjAxOjAwLjQ6IGlvbW11X2dy
b3VwX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3M6IGVudHJ5IHR5cGUgaXMgZGlyZWN0LXJlbGF4YWJs
ZQpbICAgMzcuMjIzOTMyXSBpb21tdTogaW9tbXVfbWFwOiBvcHMtPm1hcCBmYWlsZWQgaW92YSAw
eGJkZGRlMDAwIHBhIDB4MDAwMDAwMDBiZGRkZTAwMCBwZ3NpemUgMHgxMDAwClsgICAzNy4yMjY4
NTddIHBjaSAwMDAwOjAxOjAwLjQ6IGlvbW11X2dyb3VwX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3M6
IGlvbW11X21hcCBmYWlsZWQKWyAgIDM3LjIyOTMwMF0gcGNpIDAwMDA6MDE6MDAuNDogaW9tbXVf
Z3JvdXBfY3JlYXRlX2RpcmVjdF9tYXBwaW5nczogbGVhdmluZyBmdW5jClsgICAzNy4yMzE2NDhd
IHBjaSAwMDAwOjAxOjAwLjQ6IGlvbW11X2dyb3VwX2FkZF9kZXZpY2U6IGNhbGxpbmcgX19pb21t
dV9hdHRhY2hfZGV2aWNlClsgICAzNy4yMzQxOTRdIHBjaSAwMDAwOjAxOjAwLjQ6IEFkZGluZyB0
byBpb21tdSBncm91cCAyNQpbICAgMzcuMjM2MTkyXSBwY2kgMDAwMDowMTowMC40OiBETUFSOiBk
b21haW4tPnR5cGUgaXMgZG1hClsgICAzNy4yMzc5NThdIHBjaSAwMDAwOjAxOjAwLjQ6IERNQVI6
IGRldmljZSBkZWZhdWx0IGRvbWFpbiB0eXBlIGlzIGlkZW50aXR5LiByZXF1ZXN0aW5nIGlkZW50
aXR5IGRvbWFpbgpbICAgMzcuMjQxMDYxXSBwY2kgMDAwMDowMTowMC40OiBkb24ndCBjaGFuZ2Ug
bWFwcGluZ3Mgb2YgZXhpc3RpbmcgZDM3LjQ4OTg3MF0gcGNpIDAwMDA6MDE6MDAuNDogRE1BUjog
RGV2aWNlIHVzZXMgYSBwcml2YXRlIGlkZW50aXR5IGRvbWFpbi4KClRoZXJlIGlzIGFuIFJNUlIg
Zm9yIDB4YmRkZGUwMDAtMHhkZGRkZWZmZjoKCls2M0FoIDE1OTQgICAyXSAgICAgICAgICAgICAg
ICBTdWJ0YWJsZSBUeXBlIDogMDAwMSBbUmVzZXJ2ZWQgTWVtb3J5IFJlZ2lvbl0KWzYzQ2ggMTU5
NiAgIDJdICAgICAgICAgICAgICAgICAgICAgICBMZW5ndGggOiAwMDM2CgpbNjNFaCAxNTk4ICAg
Ml0gICAgICAgICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAwMDAKWzY0MGggMTYwMCAgIDJdICAg
ICAgICAgICBQQ0kgU2VnbWVudCBOdW1iZXIgOiAwMDAwCls2NDJoIDE2MDIgICA4XSAgICAgICAg
ICAgICAgICAgQmFzZSBBZGRyZXNzIDogMDAwMDAwMDBCRERERTAwMApbNjRBaCAxNjEwICAgOF0g
ICAgICAgICAgRW5kIEFkZHJlc3MgKGxpbWl0KSA6IDAwMDAwMDAwQkREREVGRkYKCls2NTJoIDE2
MTggICAxXSAgICAgICAgICAgIERldmljZSBTY29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBE
ZXZpY2VdCls2NTNoIDE2MTkgICAxXSAgICAgICAgICAgICAgICAgRW50cnkgTGVuZ3RoIDogMEEK
WzY1NGggMTYyMCAgIDJdICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgOiAwMDAwCls2NTZo
IDE2MjIgICAxXSAgICAgICAgICAgICAgIEVudW1lcmF0aW9uIElEIDogMDAKWzY1N2ggMTYyMyAg
IDFdICAgICAgICAgICAgICAgUENJIEJ1cyBOdW1iZXIgOiAwMAoKWzY1OGggMTYyNCAgIDJdICAg
ICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAxQywwNwoKWzY1QWggMTYyNiAgIDJdICAgICAg
ICAgICAgICAgICAgICAgUENJIFBhdGggOiAwMCwwMAoKCls2NUNoIDE2MjggICAxXSAgICAgICAg
ICAgIERldmljZSBTY29wZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdCls2NURoIDE2
MjkgICAxXSAgICAgICAgICAgICAgICAgRW50cnkgTGVuZ3RoIDogMEEKWzY1RWggMTYzMCAgIDJd
ICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgOiAwMDAwCls2NjBoIDE2MzIgICAxXSAgICAg
ICAgICAgICAgIEVudW1lcmF0aW9uIElEIDogMDAKWzY2MWggMTYzMyAgIDFdICAgICAgICAgICAg
ICAgUENJIEJ1cyBOdW1iZXIgOiAwMAoKWzY2MmggMTYzNCAgIDJdICAgICAgICAgICAgICAgICAg
ICAgUENJIFBhdGggOiAxQywwNwoKWzY2NGggMTYzNiAgIDJdICAgICAgICAgICAgICAgICAgICAg
UENJIFBhdGggOiAwMCwwMgoKCls2NjZoIDE2MzggICAxXSAgICAgICAgICAgIERldmljZSBTY29w
ZSBUeXBlIDogMDEgW1BDSSBFbmRwb2ludCBEZXZpY2VdCls2NjdoIDE2MzkgICAxXSAgICAgICAg
ICAgICAgICAgRW50cnkgTGVuZ3RoIDogMEEKWzY2OGggMTY0MCAgIDJdICAgICAgICAgICAgICAg
ICAgICAgUmVzZXJ2ZWQgOiAwMDAwCls2NkFoIDE2NDIgICAxXSAgICAgICAgICAgICAgIEVudW1l
cmF0aW9uIElEIDogMDAKWzY2QmggMTY0MyAgIDFdICAgICAgICAgICAgICAgUENJIEJ1cyBOdW1i
ZXIgOiAwMAoKWzY2Q2ggMTY0NCAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAx
QywwNwoKWzY2RWggMTY0NiAgIDJdICAgICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAwMCww
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
