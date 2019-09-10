Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ED79BAF07F
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 19:30:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7830FE32;
	Tue, 10 Sep 2019 17:30:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E2E2D83
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 17:30:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 44CDC8AC
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 17:30:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Sep 2019 10:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="184239176"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga008.fm.intel.com with ESMTP; 10 Sep 2019 10:30:10 -0700
Received: from orsmsx123.amr.corp.intel.com (10.22.240.116) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 10 Sep 2019 10:30:10 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.198]) by
	ORSMSX123.amr.corp.intel.com ([169.254.1.98]) with mapi id
	14.03.0439.000; Tue, 10 Sep 2019 10:30:10 -0700
From: "Mehta, Sohil" <sohil.mehta@intel.com>
To: "joro@8bytes.org" <joro@8bytes.org>, "Park, Kyung Min"
	<kyung.min.park@intel.com>
Subject: Re: [PATCH] iommu/vt-d: Add Scalable Mode fault information
Thread-Topic: [PATCH] iommu/vt-d: Add Scalable Mode fault information
Thread-Index: AQHVZN/HQgvpmNXZLUqG3t3JDwxWUaclCW2AgACd4YA=
Date: Tue, 10 Sep 2019 17:30:09 +0000
Message-ID: <1568136807.58430.11.camel@intel.com>
References: <1567793642-17063-1-git-send-email-kyung.min.park@intel.com>
	<20190910080823.GA3247@8bytes.org>
In-Reply-To: <20190910080823.GA3247@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.110.4]
Content-ID: <CFD19441763DE043B6380832CA51AC62@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Lu, Baolu" <baolu.lu@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"Raj, Ashok" <ashok.raj@intel.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "Shevchenko, 
	Andriy" <andriy.shevchenko@intel.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

T24gVHVlLCAyMDE5LTA5LTEwIGF0IDEwOjA4ICswMjAwLCBKb2VyZyBSb2VkZWwgd3JvdGU6DQo+
ID4gK8KgwqDCoMKgwqAiVW5rbm93biIsICJVbmtub3duIiwgIlVua25vd24iLCAiVW5rbm93biIs
ICJVbmtub3duIiwNCj4gIlVua25vd24iLCAiVW5rbm93biIsIC8qIDB4NDktMHg0RiAqLw0KPiAN
Cj4gTWF5YmUgYWRkIHRoZSBudW1iZXIgKDB4NDktMHg0ZikgdG8gdGhlIHJlc3BlY3RpbmcgIlVu
a25vd24iIGZpZWxkcz8NCj4gSWYNCj4gd2UgY2FuJ3QgZ2l2ZSBhIHJlYXNvbiB3ZSBzaG91bGQg
Z2l2ZSB0aGUgbnVtYmVyIGZvciBlYXNpZXIgZGVidWdnaW5nDQo+IGluDQo+IHRoZSBmdXR1cmUu
IFNhbWUgZm9yIHRoZSAiVW5rbm93biIgZmllbGRzIGJlbG93Lg0KDQpJIGJlbGlldmUgYSBmYXVs
dCBudW1iZXIgaXMgYWx3YXlzIHByaW50ZWQgaW7CoGRtYXJfZmF1bHRfZG9fb25lKCkgZXZlbg0K
aWYgdGhlIHJlYXNvbiBpcyB1bmtub3duLg0KDQpETUFSOiBbRE1BIFdyaXRlXSBSZXF1ZXN0IGRl
dmljZSBbMDA6MDIuMF0gZmF1bHQgYWRkciAxMDhhMDAwIFtmYXVsdA0KcmVhc29uIDIzXSBVbmtu
b3duDQoNCi0tU29oaWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21t
dQ==
