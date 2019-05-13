Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E44711B752
	for <lists.iommu@lfdr.de>; Mon, 13 May 2019 15:47:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0D2D4DB5;
	Mon, 13 May 2019 13:47:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EEAFF9D
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 13:47:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 13A3027B
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 13:47:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBD6180D;
	Mon, 13 May 2019 06:47:11 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCB453F71E;
	Mon, 13 May 2019 06:47:08 -0700 (PDT)
Subject: Re: [PATCH v7 18/23] iommu/smmuv3: Report non recoverable faults
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
	alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
	yi.l.liu@intel.com, jean-philippe.brucker@arm.com, will.deacon@arm.com
References: <20190408121911.24103-1-eric.auger@redhat.com>
	<20190408121911.24103-19-eric.auger@redhat.com>
	<52dd9de0-67a9-0316-cfe1-83d855d26c66@arm.com>
	<46f39a8e-a909-5493-b1eb-f8f082b0bb20@redhat.com>
	<3119943e-30f1-823d-c6a2-157b26901a41@arm.com>
	<6a78e67d-cc8b-6564-c122-b13c3a288d46@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <209d4f80-dbcb-a3ed-81bc-4050db2a74a1@arm.com>
Date: Mon, 13 May 2019 14:47:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6a78e67d-cc8b-6564-c122-b13c3a288d46@redhat.com>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, vincent.stehle@arm.com,
	ashok.raj@intel.com, marc.zyngier@arm.com, christoffer.dall@arm.com
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

T24gMTMvMDUvMjAxOSAxMzozMiwgQXVnZXIgRXJpYyB3cm90ZToKPiBIaSBSb2JpbiwKPiBPbiA1
LzEzLzE5IDE6NTQgUE0sIFJvYmluIE11cnBoeSB3cm90ZToKPj4gT24gMTMvMDUvMjAxOSAwODo0
NiwgQXVnZXIgRXJpYyB3cm90ZToKPj4+IEhpIFJvYmluLAo+Pj4KPj4+IE9uIDUvOC8xOSA3OjIw
IFBNLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+Pj4gT24gMDgvMDQvMjAxOSAxMzoxOSwgRXJpYyBB
dWdlciB3cm90ZToKPj4+Pj4gV2hlbiBhIHN0YWdlIDEgcmVsYXRlZCBmYXVsdCBldmVudCBpcyBy
ZWFkIGZyb20gdGhlIGV2ZW50IHF1ZXVlLAo+Pj4+PiBsZXQncyBwcm9wYWdhdGUgaXQgdG8gcG90
ZW50aWFsIGV4dGVybmFsIGZhdWx0IGxpc3RlbmVycywgaWUuIHVzZXJzCj4+Pj4+IHdobyByZWdp
c3RlcmVkIGEgZmF1bHQgaGFuZGxlci4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBB
dWdlciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPgo+Pj4+Pgo+Pj4+PiAtLS0KPj4+Pj4gdjQgLT4g
djU6Cj4+Pj4+IC0gcy9JT01NVV9GQVVMVF9QRVJNX0lOU1QvSU9NTVVfRkFVTFRfUEVSTV9FWEVD
Cj4+Pj4+IC0tLQo+Pj4+PiAgwqDCoCBkcml2ZXJzL2lvbW11L2FybS1zbW11LXYzLmMgfCAxNjkK
Pj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4+Pj4+ICDCoMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2FybS1zbW11LXYzLmMgYi9kcml2ZXJzL2lv
bW11L2FybS1zbW11LXYzLmMKPj4+Pj4gaW5kZXggODA0NDQ0NWJjMzJhLi4xZmQzMjA3ODhkY2Ig
MTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUtdjMuYwo+Pj4+PiArKysg
Yi9kcml2ZXJzL2lvbW11L2FybS1zbW11LXYzLmMKPj4+Pj4gQEAgLTE2Nyw2ICsxNjcsMjYgQEAK
Pj4+Pj4gIMKgwqAgI2RlZmluZSBBUk1fU01NVV9QUklRX0lSUV9DRkcxwqDCoMKgwqDCoMKgwqAg
MHhkOAo+Pj4+PiAgwqDCoCAjZGVmaW5lIEFSTV9TTU1VX1BSSVFfSVJRX0NGRzLCoMKgwqDCoMKg
wqDCoCAweGRjCj4+Pj4+ICDCoMKgICsvKiBFdmVudHMgKi8KPj4+Pj4gKyNkZWZpbmUgQVJNX1NN
TVVfRVZUX0ZfVVVUwqDCoMKgwqDCoMKgwqAgMHgwMQo+Pj4+PiArI2RlZmluZSBBUk1fU01NVV9F
VlRfQ19CQURfU1RSRUFNSUTCoMKgwqAgMHgwMgo+Pj4+PiArI2RlZmluZSBBUk1fU01NVV9FVlRf
Rl9TVEVfRkVUQ0jCoMKgwqAgMHgwMwo+Pj4+PiArI2RlZmluZSBBUk1fU01NVV9FVlRfQ19CQURf
U1RFwqDCoMKgwqDCoMKgwqAgMHgwNAo+Pj4+PiArI2RlZmluZSBBUk1fU01NVV9FVlRfRl9CQURf
QVRTX1RSRVHCoMKgwqAgMHgwNQo+Pj4+PiArI2RlZmluZSBBUk1fU01NVV9FVlRfRl9TVFJFQU1f
RElTQUJMRUTCoMKgwqAgMHgwNgo+Pj4+PiArI2RlZmluZSBBUk1fU01NVV9FVlRfRl9UUkFOU0xf
Rk9SQklEREVOwqDCoMKgIDB4MDcKPj4+Pj4gKyNkZWZpbmUgQVJNX1NNTVVfRVZUX0NfQkFEX1NV
QlNUUkVBTUlEwqDCoMKgIDB4MDgKPj4+Pj4gKyNkZWZpbmUgQVJNX1NNTVVfRVZUX0ZfQ0RfRkVU
Q0jCoMKgwqDCoMKgwqDCoCAweDA5Cj4+Pj4+ICsjZGVmaW5lIEFSTV9TTU1VX0VWVF9DX0JBRF9D
RMKgwqDCoMKgwqDCoMKgIDB4MGEKPj4+Pj4gKyNkZWZpbmUgQVJNX1NNTVVfRVZUX0ZfV0FMS19F
QUJUwqDCoMKgIDB4MGIKPj4+Pj4gKyNkZWZpbmUgQVJNX1NNTVVfRVZUX0ZfVFJBTlNMQVRJT07C
oMKgwqAgMHgxMAo+Pj4+PiArI2RlZmluZSBBUk1fU01NVV9FVlRfRl9BRERSX1NJWkXCoMKgwqAg
MHgxMQo+Pj4+PiArI2RlZmluZSBBUk1fU01NVV9FVlRfRl9BQ0NFU1PCoMKgwqDCoMKgwqDCoCAw
eDEyCj4+Pj4+ICsjZGVmaW5lIEFSTV9TTU1VX0VWVF9GX1BFUk1JU1NJT07CoMKgwqAgMHgxMwo+
Pj4+PiArI2RlZmluZSBBUk1fU01NVV9FVlRfRl9UTEJfQ09ORkxJQ1TCoMKgwqAgMHgyMAo+Pj4+
PiArI2RlZmluZSBBUk1fU01NVV9FVlRfRl9DRkdfQ09ORkxJQ1TCoMKgwqAgMHgyMQo+Pj4+PiAr
I2RlZmluZSBBUk1fU01NVV9FVlRfRV9QQUdFX1JFUVVFU1TCoMKgwqAgMHgyNAo+Pj4+PiArCj4+
Pj4+ICDCoMKgIC8qIENvbW1vbiBNU0kgY29uZmlnIGZpZWxkcyAqLwo+Pj4+PiAgwqDCoCAjZGVm
aW5lIE1TSV9DRkcwX0FERFJfTUFTS8KgwqDCoMKgwqDCoMKgIEdFTk1BU0tfVUxMKDUxLCAyKQo+
Pj4+PiAgwqDCoCAjZGVmaW5lIE1TSV9DRkcyX1NIwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRU5N
QVNLKDUsIDQpCj4+Pj4+IEBAIC0zMzIsNiArMzUyLDE1IEBACj4+Pj4+ICDCoMKgICNkZWZpbmUg
RVZUUV9NQVhfU1pfU0hJRlTCoMKgwqDCoMKgwqDCoCA3Cj4+Pj4+ICDCoMKgIMKgICNkZWZpbmUg
RVZUUV8wX0lEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRU5NQVNLX1VMTCg3LCAwKQo+Pj4+PiAr
I2RlZmluZSBFVlRRXzBfU1NWwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRU5NQVNLX1VMTCgxMSwg
MTEpCj4+Pj4+ICsjZGVmaW5lIEVWVFFfMF9TVUJTVFJFQU1JRMKgwqDCoMKgwqDCoMKgIEdFTk1B
U0tfVUxMKDMxLCAxMikKPj4+Pj4gKyNkZWZpbmUgRVZUUV8wX1NUUkVBTUlEwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBHRU5NQVNLX1VMTCg2MywgMzIpCj4+Pj4+ICsjZGVmaW5lIEVWVFFfMV9QTlXC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdFTk1BU0tfVUxMKDMzLCAzMykKPj4+Pj4gKyNkZWZpbmUg
RVZUUV8xX0lORMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0VOTUFTS19VTEwoMzQsIDM0KQo+Pj4+
PiArI2RlZmluZSBFVlRRXzFfUk5XwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRU5NQVNLX1VMTCgz
NSwgMzUpCj4+Pj4+ICsjZGVmaW5lIEVWVFFfMV9TMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0VO
TUFTS19VTEwoMzksIDM5KQo+Pj4+PiArI2RlZmluZSBFVlRRXzFfQ0xBU1PCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEdFTk1BU0tfVUxMKDQwLCA0MSkKPj4+Pj4gKyNkZWZpbmUgRVZUUV8zX0ZFVENI
X0FERFLCoMKgwqDCoMKgwqDCoCBHRU5NQVNLX1VMTCg1MSwgMykKPj4+Pj4gIMKgwqAgwqAgLyog
UFJJIHF1ZXVlICovCj4+Pj4+ICDCoMKgICNkZWZpbmUgUFJJUV9FTlRfRFdPUkRTwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAyCj4+Pj4+IEBAIC02MzksNiArNjY4LDY0IEBAIHN0cnVjdCBhcm1fc21t
dV9kb21haW4gewo+Pj4+PiAgwqDCoMKgwqDCoMKgIHNwaW5sb2NrX3TCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRldmljZXNfbG9jazsKPj4+Pj4gIMKgwqAgfTsKPj4+Pj4gIMKgwqAgKy8qIGZhdWx0
IHByb3BhZ2F0aW9uICovCj4+Pj4+ICsKPj4+Pj4gKyNkZWZpbmUgSU9NTVVfRkFVTFRfRl9GSUVM
RFPCoMKgwqAgKElPTU1VX0ZBVUxUX1VOUkVDT1ZfUEFTSURfVkFMSUQgfCBcCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJT01NVV9GQVVMVF9VTlJFQ09WX1BFUk1fVkFM
SUQgfCBcCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJT01NVV9GQVVM
VF9VTlJFQ09WX0FERFJfVkFMSUQpCj4+Pj4+ICsKPj4+Pj4gK3N0cnVjdCBhcm1fc21tdV9mYXVs
dF9wcm9wYWdhdGlvbl9kYXRhIHsKPj4+Pj4gK8KgwqDCoCBlbnVtIGlvbW11X2ZhdWx0X3JlYXNv
biByZWFzb247Cj4+Pj4+ICvCoMKgwqAgYm9vbCBzMV9jaGVjazsKPj4+Pj4gK8KgwqDCoCB1MzIg
ZmllbGRzOyAvKiBJT01NVV9GQVVMVF9VTlJFQ09WXypfVkFMSUQgYml0cyAqLwo+Pj4+PiArfTsK
Pj4+Pj4gKwo+Pj4+PiArLyoKPj4+Pj4gKyAqIERlc2NyaWJlcyBob3cgU01NVSBmYXVsdHMgdHJh
bnNsYXRlIGludG8gZ2VuZXJpYyBJT01NVSBmYXVsdHMKPj4+Pj4gKyAqIGFuZCBpZiB0aGV5IG5l
ZWQgdG8gYmUgcmVwb3J0ZWQgZXh0ZXJuYWxseQo+Pj4+PiArICovCj4+Pj4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGFybV9zbW11X2ZhdWx0X3Byb3BhZ2F0aW9uX2RhdGEKPj4+Pj4gZmF1bHRfcHJv
cGFnYXRpb25bXSA9IHsKPj4+Pj4gK1tBUk1fU01NVV9FVlRfRl9VVVRdwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA9IHsgfSwKPj4+Pj4gK1tBUk1fU01NVV9FVlRfQ19CQURfU1RSRUFNSURdwqDCoMKg
wqDCoMKgwqAgPSB7IH0sCj4+Pj4+ICtbQVJNX1NNTVVfRVZUX0ZfU1RFX0ZFVENIXcKgwqDCoMKg
wqDCoMKgID0geyB9LAo+Pj4+PiArW0FSTV9TTU1VX0VWVF9DX0JBRF9TVEVdwqDCoMKgwqDCoMKg
wqAgPSB7IH0sCj4+Pj4+ICtbQVJNX1NNTVVfRVZUX0ZfQkFEX0FUU19UUkVRXcKgwqDCoMKgwqDC
oMKgID0geyB9LAo+Pj4+PiArW0FSTV9TTU1VX0VWVF9GX1NUUkVBTV9ESVNBQkxFRF3CoMKgwqAg
PSB7IH0sCj4+Pj4+ICtbQVJNX1NNTVVfRVZUX0ZfVFJBTlNMX0ZPUkJJRERFTl3CoMKgwqAgPSB7
IH0sCj4+Pj4+ICtbQVJNX1NNTVVfRVZUX0NfQkFEX1NVQlNUUkVBTUlEXcKgwqDCoCA9Cj4+Pj4+
IHtJT01NVV9GQVVMVF9SRUFTT05fUEFTSURfSU5WQUxJRCwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhbHNlLAo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSU9NTVVfRkFVTFRfVU5SRUNPVl9QQVNJ
RF9WQUxJRAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0sCj4+Pj4+ICtbQVJNX1NNTVVfRVZUX0ZfQ0RfRkVUQ0hdwqDCoMKgwqDCoMKgwqAgPSB7SU9N
TVVfRkFVTFRfUkVBU09OX1BBU0lEX0ZFVENILAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFsc2UsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJT01NVV9GQVVMVF9VTlJFQ09WX1BBU0lEX1ZBTElE
IHwKPj4+Pgo+Pj4+IEl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBwcmVzdW1lIHZhbGlkaXR5IGhl
cmUsIG9yIGluIGFueSBvZiB0aGUgZmF1bHRzCj4+Pj4gYmVsb3cuLi4KPj4+Cj4+Pgo+Pj4+Cj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJT01NVV9G
QVVMVF9VTlJFQ09WX0ZFVENIX0FERFJfVkFMSUQKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+PiArW0FSTV9TTU1VX0VWVF9DX0JBRF9DRF3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgID0KPj4+Pj4ge0lPTU1VX0ZBVUxUX1JFQVNPTl9CQURfUEFT
SURfRU5UUlksCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmYWxzZSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIElPTU1VX0ZBVUxUX1VOUkVDT1ZfUEFTSURfVkFMSUQKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+PiArW0FSTV9TTU1VX0VWVF9G
X1dBTEtfRUFCVF3CoMKgwqDCoMKgwqDCoCA9IHtJT01NVV9GQVVMVF9SRUFTT05fV0FMS19FQUJU
LAo+Pj4+PiB0cnVlLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgSU9NTVVfRkFVTFRfRl9GSUVMRFMgfAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSU9NTVVfRkFVTFRfVU5SRUNPVl9GRVRDSF9BRERS
X1ZBTElECj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fSwKPj4+Pj4gK1tBUk1fU01NVV9FVlRfRl9UUkFOU0xBVElPTl3CoMKgwqDCoMKgwqDCoCA9IHtJ
T01NVV9GQVVMVF9SRUFTT05fUFRFX0ZFVENILAo+Pj4+PiB0cnVlLAo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSU9NTVVfRkFVTFRfRl9GSUVMRFMK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+
PiArW0FSTV9TTU1VX0VWVF9GX0FERFJfU0laRV3CoMKgwqDCoMKgwqDCoCA9IHtJT01NVV9GQVVM
VF9SRUFTT05fT09SX0FERFJFU1MsCj4+Pj4+IHRydWUsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJT01NVV9GQVVMVF9GX0ZJRUxEUwo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0sCj4+Pj4+ICtbQVJN
X1NNTVVfRVZUX0ZfQUNDRVNTXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSB7SU9NTVVfRkFVTFRf
UkVBU09OX0FDQ0VTUywgdHJ1ZSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIElPTU1VX0ZBVUxUX0ZfRklFTERTCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4gK1tBUk1fU01NVV9FVlRfRl9Q
RVJNSVNTSU9OXcKgwqDCoMKgwqDCoMKgID0ge0lPTU1VX0ZBVUxUX1JFQVNPTl9QRVJNSVNTSU9O
LAo+Pj4+PiB0cnVlLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgSU9NTVVfRkFVTFRfRl9GSUVMRFMKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+PiArW0FSTV9TTU1VX0VWVF9GX1RMQl9DT05G
TElDVF3CoMKgwqDCoMKgwqDCoCA9IHsgfSwKPj4+Pj4gK1tBUk1fU01NVV9FVlRfRl9DRkdfQ09O
RkxJQ1RdwqDCoMKgwqDCoMKgwqAgPSB7IH0sCj4+Pj4+ICtbQVJNX1NNTVVfRVZUX0VfUEFHRV9S
RVFVRVNUXcKgwqDCoMKgwqDCoMKgID0geyB9LAo+Pj4+PiArfTsKPj4+Pj4gKwo+Pj4+PiAgwqDC
oCBzdHJ1Y3QgYXJtX3NtbXVfb3B0aW9uX3Byb3Agewo+Pj4+PiAgwqDCoMKgwqDCoMKgIHUzMiBv
cHQ7Cj4+Pj4+ICDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqcHJvcDsKPj4+Pj4gQEAgLTEyNTgs
NyArMTM0NSw2IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfaW5pdF9sMl9zdHJ0YWIoc3RydWN0Cj4+
Pj4+IGFybV9zbW11X2RldmljZSAqc21tdSwgdTMyIHNpZCkKPj4+Pj4gIMKgwqDCoMKgwqDCoCBy
ZXR1cm4gMDsKPj4+Pj4gIMKgwqAgfQo+Pj4+PiAgwqDCoCAtX19tYXliZV91bnVzZWQKPj4+Pj4g
IMKgwqAgc3RhdGljIHN0cnVjdCBhcm1fc21tdV9tYXN0ZXJfZGF0YSAqCj4+Pj4+ICDCoMKgIGFy
bV9zbW11X2ZpbmRfbWFzdGVyKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUsIHUzMiBzaWQp
Cj4+Pj4+ICDCoMKgIHsKPj4+Pj4gQEAgLTEyODQsMjQgKzEzNzAsODUgQEAgYXJtX3NtbXVfZmlu
ZF9tYXN0ZXIoc3RydWN0IGFybV9zbW11X2RldmljZQo+Pj4+PiAqc21tdSwgdTMyIHNpZCkKPj4+
Pj4gIMKgwqDCoMKgwqDCoCByZXR1cm4gbWFzdGVyOwo+Pj4+PiAgwqDCoCB9Cj4+Pj4+ICDCoMKg
ICsvKiBQb3B1bGF0ZXMgdGhlIHJlY29yZCBmaWVsZHMgYWNjb3JkaW5nIHRvIHRoZSBpbnB1dCBT
TU1VIGV2ZW50ICovCj4+Pj4+ICtzdGF0aWMgYm9vbCBhcm1fc21tdV90cmFuc2NvZGVfZmF1bHQo
dTY0ICpldnQsIHU4IHR5cGUsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBpb21tdV9mYXVsdF91bnJlY292ZXJhYmxlICpyZWNvcmQpCj4+Pj4+
ICt7Cj4+Pj4+ICvCoMKgwqAgY29uc3Qgc3RydWN0IGFybV9zbW11X2ZhdWx0X3Byb3BhZ2F0aW9u
X2RhdGEgKmRhdGE7Cj4+Pj4+ICvCoMKgwqAgdTMyIGZpZWxkczsKPj4+Pj4gKwo+Pj4+PiArwqDC
oMKgIGlmICh0eXBlID49IEFSUkFZX1NJWkUoZmF1bHRfcHJvcGFnYXRpb24pKQo+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgZGF0YSA9ICZm
YXVsdF9wcm9wYWdhdGlvblt0eXBlXTsKPj4+Pj4gK8KgwqDCoCBpZiAoIWRhdGEtPnJlYXNvbikK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKg
IGZpZWxkcyA9IGRhdGEtPmZpZWxkczsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGlmIChkYXRhLT5z
MV9jaGVjayAmIEZJRUxEX0dFVChFVlRRXzFfUzIsIGV2dFsxXSkpCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZmFsc2U7IC8qIFMyIHJlbGF0ZWQgZmF1bHQsIGRvbid0IHByb3BhZ2F0ZSAq
Lwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKGZpZWxkcyAmIElPTU1VX0ZBVUxUX1VOUkVDT1Zf
UEFTSURfVkFMSUQpIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChGSUVMRF9HRVQoRVZUUV8w
X1NTViwgZXZ0WzBdKSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjb3JkLT5wYXNp
ZCA9IEZJRUxEX0dFVChFVlRRXzBfU1VCU1RSRUFNSUQsIGV2dFswXSk7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBlbHNlCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpZWxkcyAmPSB+SU9N
TVVfRkFVTFRfVU5SRUNPVl9QQVNJRF9WQUxJRDsKPj4+Pgo+Pj4+IC4uLmJlY2F1c2UgdGhpcyBs
b2dpYyB0aGVuIGJyZWFrcyBmb3IgQ19CQURfU1VCU1RSRUFNSUQsIHdoaWNoIGVuZHMgdXAKPj4+
PiBjb21pbmcgb3V0IG9mIGhlcmUgKndpdGhvdXQqIHJlcG9ydGluZyB0aGUgb2ZmZW5kaW5nIFBB
U0lELgo+Pj4gQ29ycmVjdC4KPj4+Pgo+Pj4+PiArwqDCoMKgIH0KPj4+Pj4gK8KgwqDCoCBpZiAo
ZmllbGRzICYgSU9NTVVfRkFVTFRfVU5SRUNPVl9QRVJNX1ZBTElEKSB7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoIUZJRUxEX0dFVChFVlRRXzFfUk5XLCBldnRbMV0pKQo+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZWNvcmQtPnBlcm0gfD0gSU9NTVVfRkFVTFRfUEVSTV9XUklURTsK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChGSUVMRF9HRVQoRVZUUV8xX1BOVSwgZXZ0WzFdKSkK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjb3JkLT5wZXJtIHw9IElPTU1VX0ZBVUxU
X1BFUk1fUFJJVjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChGSUVMRF9HRVQoRVZUUV8xX0lO
RCwgZXZ0WzFdKSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjb3JkLT5wZXJtIHw9
IElPTU1VX0ZBVUxUX1BFUk1fRVhFQzsKPj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+ICvCoMKgwqAgaWYg
KGZpZWxkcyAmIElPTU1VX0ZBVUxUX1VOUkVDT1ZfQUREUl9WQUxJRCkKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJlY29yZC0+YWRkciA9IGV2dFsyXTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGlmIChm
aWVsZHMgJiBJT01NVV9GQVVMVF9VTlJFQ09WX0ZFVENIX0FERFJfVkFMSUQpCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCByZWNvcmQtPmZldGNoX2FkZHIgPSBGSUVMRF9HRVQoRVZUUV8zX0ZFVENIX0FE
RFIsIGV2dFszXSk7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCByZWNvcmQtPmZsYWdzID0gZmllbGRz
Owo+Pj4+PiArwqDCoMKgIHJldHVybiB0cnVlOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0
aWMgdm9pZCBhcm1fc21tdV9yZXBvcnRfZXZlbnQoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21t
dSwgdTY0Cj4+Pj4+ICpldnQpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqAgdTMyIHNpZCA9IEZJRUxE
X0dFVChFVlRRXzBfU1RSRUFNSUQsIGV2dFswXSk7Cj4+Pj4+ICvCoMKgwqAgdTggdHlwZSA9IEZJ
RUxEX0dFVChFVlRRXzBfSUQsIGV2dFswXSk7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IGFybV9zbW11
X21hc3Rlcl9kYXRhICptYXN0ZXI7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IGlvbW11X2ZhdWx0X2V2
ZW50IGV2ZW50ID0ge307Cj4+Pj4+ICvCoMKgwqAgaW50IGk7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDC
oCBtYXN0ZXIgPSBhcm1fc21tdV9maW5kX21hc3RlcihzbW11LCBzaWQpOwo+Pj4+PiArwqDCoMKg
IGlmIChXQVJOX09OKCFtYXN0ZXIpKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+
Cj4+Pj4gTkFLLiBJZiBJJ20gZ2V0dGluZyBnbG9iYWwgZmF1bHRzIGxpa2UgQ19CQURfU1RFIHdo
ZXJlIGEgZGV2aWNlIGFsbW9zdAo+Pj4+IGNlcnRhaW5seSAqaXNuJ3QqIGNvbmZpZ3VyZWQgKGJl
Y2F1c2UgaGV5LCB3ZSB3b3VsZCBoYXZlIGluaXRpYWxpc2VkIGl0cwo+Pj4+IFNURXMgaWYgd2Ug
a25ldyksIHRoZW4gSSBzdXJlIGFzIGhlbGwgd2FudCB0byBzZWUgdGhlIGFjdHVhbCBmYXVsdHMu
Cj4+Pj4gU3BhbW1pbmcgYSBjb25zdGFudCBzdHJlYW0gb2Ygc3RhY2sgdHJhY2VzICppbnN0ZWFk
KiBvZiBzaG93aW5nIHRoZW0gaXMKPj4+PiB3b3JzZSB0aGFuIHVzZWxlc3MuCj4+PiBTdXJlLCBp
ZiAhbWFzdGVyIEkgd2lsbCBvdXRwdXQgdGhlIG9yaWdpbmFsIHRyYWNlcy4KPj4+Pgo+Pj4+PiAr
Cj4+Pj4+ICvCoMKgwqAgZXZlbnQuZmF1bHQudHlwZSA9IElPTU1VX0ZBVUxUX0RNQV9VTlJFQ09W
Owo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKGFybV9zbW11X3RyYW5zY29kZV9mYXVsdChldnQs
IHR5cGUsICZldmVudC5mYXVsdC5ldmVudCkpIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlvbW11
X3JlcG9ydF9kZXZpY2VfZmF1bHQobWFzdGVyLT5kZXYsICZldmVudCk7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm47Cj4+Pj4KPj4+PiBBbmQgYWdhaW4sIHRoZSB2YXN0IG1ham9yaXR5IG9m
IHRoZSB0aW1lLCB0aGVyZSB3b24ndCBiZSBhIGZhdWx0IGhhbmRsZXIKPj4+PiByZWdpc3RlcmVk
LCBzbyB1bmNvbmRpdGlvbmFsbHkgc3VwcHJlc3NpbmcgdGhlIG1vc3QgY29tbW9uIGFuZCB1c2Vm
dWwKPj4+PiBzdHVmZiBsaWtlIHRyYW5zbGF0aW9uIGFuZCBwZXJtaXNzaW9uIGZhdWx0cyBpcyB2
ZXJ5IG11Y2ggbm90IE9LLgo+Pj4gR29pbmcgdG8gdGVzdCB3aGV0aGVyIHdlIGFyZSBpbiBuZXN0
ZWQgbW9kZSBiZWZvcmUgZW50ZXJpbmcgdGhhdCBwYXRoLgo+Pgo+PiBJIGRvbid0IHRoaW5rIHRo
aXMgaGFzIHRvIGJlIGV4Y2x1c2l2ZSB0byBuZXN0aW5nIC0gdGhlIGdlbmVyaWMKPj4gcmVwb3J0
aW5nIG1lY2hhbmlzbSBmZWVscyBsaWtlIGl0IG1pZ2h0IHVsdGltYXRlbHkgYmUgZXh0ZW5zaWJs
ZSB0bwo+PiBvdGhlciB0aGluZ3MgbGlrZSBSb2IncyBjYXNlIGZvciBnZW5lcmFsaXNlZCBzdGFs
bGluZy4gSXQncyBqdXN0IHRoYXQKPj4gZm9yIHJvYnVzdG5lc3MsIGV2ZW4gd2hlbiBhIGZhdWx0
IGhhbmRsZXIgaXMgcHJlc2VudCwgd2Ugc3RpbGwgd2FudCB0aGUKPj4gZHJpdmVyIHRvIGJlIGFi
bGUgdG8gcmVwb3J0IGlmIGl0IGRpZG4ndCBhY3R1YWxseSBoYW5kbGUgYSBmYXVsdC4KPiAKPiAK
PiBKZWFuLVBoaWxpcHBlIHBvaW50ZWQgb3V0IGluIGEgcHJldmlvdXMgcmV2aWV3Cj4gKGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA3NTE4MDEvIzIyNDI0MDQ3KSB0aGF0IHRo
ZSBndWVzdAo+IGNhbiBmbG9vZCB0aGUgaG9zdCBsb2cgd2l0aCBTMSByZWxhdGVkIGZhdWx0cy4g
QXQgdGhlIG1vbWVudCB3ZSBkbyBub3QKPiBjaGVjayB0aGF0IGEgZmF1bHQgaGFuZGxlciBpcyBy
ZWdpc3RlcmVkIGluIG5lc3RlZCBtb2RlLiBNYXliZSB3ZQo+IHNob3VsZD8gRXZlbiBpZiB0aGUg
ZmF1bHQgaGFuZGxlciBpcyByZWdpc3RlcmVkLCBhcyBpdCBpcyBiYXNlZCBvbiBhCj4gY2lyY3Vs
YXIgYnVmZmVyLCB0aGlzIGxhdHRlciBjYW4gYmUgZnVsbCBhbmQgbGVhZCB0byBhIGxvZyBmbG9v
ZC4KCkFoLCByaWdodCwgSSBkaWRuJ3QgcXVpdGUgaGF2ZSB0aGUgZnVsbCBwaWN0dXJlIGluIG1p
bmQsIHRoYW5rcyBmb3IgdGhlIApqb2cuIEkgZ3Vlc3MgaW4gdGhhdCBjYXNlIHdlIHdhbnQgc29t
ZSBkZWdyZWUgb2Ygc3BlY2lhbC1jYXNpbmcgZm9yIApuZXN0ZWQgY29uZmlncyAtIGFueXRoaW5n
IFMxLXJlbGF0ZWQgdGhhdCB3ZSBleHBlY3QgdGhlIGZhdWx0IGhhbmRsZXIgdG8gCnNpbXBseSBp
bmplY3QgYmFjayBpbnRvIHRoZSBndWVzdCwgd2UgY2FuIGluZGVlZCBzdXBwcmVzcyBvbiB0aGUg
aG9zdCwgCmJ1dCBJIGRvIHRoaW5rIGl0J3Mgd29ydGggYW50aWNpcGF0aW5nIGhvc3QtcmVsYXRl
ZCBmYXVsdHMgKGFuZCBlbnRpcmVseSAKaG9zdC1vd25lZCBmYXVsdC1oYW5kbGVycyBpbiBmdXR1
cmUpIGFzIHdlbGwuCgpSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lvbW11
