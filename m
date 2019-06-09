Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DBADC3A36A
	for <lists.iommu@lfdr.de>; Sun,  9 Jun 2019 04:50:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E4122B5F;
	Sun,  9 Jun 2019 02:50:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 62F0DAF5
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 02:50:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EB01A174
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 02:50:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2019 19:50:46 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga004.jf.intel.com with ESMTP; 08 Jun 2019 19:50:43 -0700
Subject: Re: "iommu/vt-d: Delegate DMA domain to generic iommu" series breaks
	megaraid_sas
To: Qian Cai <cai@lca.pw>
References: <1559941717.6132.63.camel@lca.pw>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1e4f0642-e4e1-7602-3f50-37edc84ced50@linux.intel.com>
Date: Sun, 9 Jun 2019 10:43:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559941717.6132.63.camel@lca.pw>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Joerg Roedel <jroedel@suse.de>,
	Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Kashyap Desai <kashyap.desai@broadcom.com>,
	Sumit Saxena <sumit.saxena@broadcom.com>, iommu@lists.linux-foundation.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

SGkgUWlhbiwKCkkganVzdCBwb3N0ZWQgc29tZSBmaXggcGF0Y2hlcy4gSSBjYydlZCB0aGVtIGlu
IHlvdXIgZW1haWwgaW5ib3ggYXMKd2VsbC4gQ2FuIHlvdSBwbGVhc2UgY2hlY2sgd2hldGhlciB0
aGV5IGhhcHBlbiB0byBmaXggeW91ciBpc3N1ZT8KSWYgbm90LCBkbyB5b3UgbWluZCBwb3N0aW5n
IG1vcmUgZGVidWcgbWVzc2FnZXM/CgpCZXN0IHJlZ2FyZHMsCkJhb2x1CgoKT24gNi84LzE5IDU6
MDggQU0sIFFpYW4gQ2FpIHdyb3RlOgo+IFRoZSBsaW51eC1uZXh0IHNlcmllcyAiaW9tbXUvdnQt
ZDogRGVsZWdhdGUgRE1BIGRvbWFpbiB0byBnZW5lcmljIGlvbW11IiBbMV0KPiBjYXVzZXMgYSBz
eXN0ZW0gd2l0aCB0aGUgcm9vdGZzIG9uIG1lZ2FyYWlkX3NhcyBjYXJkIHVuYWJsZSB0byBib290
Lgo+IAo+IFJldmVydGVkIHRoZSB3aG9sZSBzZXJpZXMgb24gdGhlIHRvcCBvZiBsaW51eC1uZXh0
IChuZXh0LTIwMTkwNjA3KSBmaXhlZCB0aGUKPiBpc3N1ZS4KPiAKPiBUaGUgaW5mb3JtYXRpb24g
cmVnYXJkcyB0aGlzIHN0b3JhZ2UgY2FyZCBpcywKPiAKPiBbwqDCoDExNi40NjY4MTBdW8KgwqBU
MzI0XSBtZWdhcmFpZF9zYXMgMDAwMDowNjowMC4wOiBGVyBwcm92aWRlZCBzdXBwb3J0TWF4RXh0
TERzOgo+IDAJbWF4X2xkczogMzIKPiBbwqDCoDExNi40NzYwNTJdW8KgwqBUMzI0XSBtZWdhcmFp
ZF9zYXMgMDAwMDowNjowMC4wOiBjb250cm9sbGVyIHR5cGUJOgo+IGlNUigwTUIpCj4gW8KgwqAx
MTYuNDgzNjQ2XVvCoMKgVDMyNF0gbWVnYXJhaWRfc2FzIDAwMDA6MDY6MDAuMDogT25saW5lIENv
bnRyb2xsZXIgUmVzZXQoT0NSKQkKPiA6IEVuYWJsZWQKPiBbwqDCoDExNi40OTI0MDNdW8KgwqBU
MzI0XSBtZWdhcmFpZF9zYXMgMDAwMDowNjowMC4wOiBTZWN1cmUgSkJPRCBzdXBwb3J0CToKPiBZ
ZXMKPiBbwqDCoDExNi40OTk4ODddW8KgwqBUMzI0XSBtZWdhcmFpZF9zYXMgMDAwMDowNjowMC4w
OiBOVk1lIHBhc3N0aHJ1IHN1cHBvcnQJOgo+IE5vCj4gW8KgwqAxMTYuNTA3NDgwXVvCoMKgVDMy
NF0gbWVnYXJhaWRfc2FzIDAwMDA6MDY6MDAuMDogRlcgcHJvdmlkZWQKPiBbwqDCoDExNi42MTI1
MjNdW8KgwqBUMzI0XSBtZWdhcmFpZF9zYXMgMDAwMDowNjowMC4wOiBOVk1FIHBhZ2Ugc2l6ZQk6
ICgwKQo+IFvCoMKgMTE2LjYyOTk5MV1bwqDCoFQzMjRdIG1lZ2FyYWlkX3NhcyAwMDAwOjA2OjAw
LjA6IElOSVQgYWRhcHRlciBkb25lCj4gW8KgwqAxMTYuNzE0Nzg5XVvCoMKgVDMyNF0gbWVnYXJh
aWRfc2FzIDAwMDA6MDY6MDAuMDogcGNpIGlkCQk6Cj4gKDB4MTAwMCkvKDB4MDAxNykvKDB4MWQ0
OSkvKDB4MDUwMCkKPiBbwqDCoDExNi43MjQyMjhdW8KgwqBUMzI0XSBtZWdhcmFpZF9zYXMgMDAw
MDowNjowMC4wOiB1bmV2ZW5zcGFuIHN1cHBvcnQJOiBubwo+IFvCoMKgMTE2LjczMTUxOF1bwqDC
oFQzMjRdIG1lZ2FyYWlkX3NhcyAwMDAwOjA2OjAwLjA6IGZpcm13YXJlIGNyYXNoIGR1bXAJOgo+
IG5vCj4gW8KgwqAxMTYuNzM4OTgxXVvCoMKgVDMyNF0gbWVnYXJhaWRfc2FzIDAwMDA6MDY6MDAu
MDogamJvZCBzeW5jIG1hcAkJOgo+IHllcwo+IFvCoMKgMTE2Ljc4NzQzM11bwqDCoFQzMjRdIHNj
c2kgaG9zdDA6IEF2YWdvIFNBUyBiYXNlZCBNZWdhUkFJRCBkcml2ZXIKPiBbwqDCoDExNy4wODEw
ODhdW8KgwqBUMzI0XSBzY3NpIDA6MDowOjA6IERpcmVjdC0KPiBBY2Nlc3PCoMKgwqDCoMKgTEVO
T1ZPwqDCoMKgU1Q5MDBNTTAxNjjCoMKgwqDCoMKgwqBMNTg3IFBROiAwIEFOU0k6IDYKPiAKPiBb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL2NvdmVyLzEwNzg5NjAvCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxp
bmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
