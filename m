Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6B6E82E
	for <lists.iommu@lfdr.de>; Fri, 19 Jul 2019 17:47:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1884A2857;
	Fri, 19 Jul 2019 15:47:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B1F73284F
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 15:47:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 470758B1
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 15:47:20 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x6JFkh1b087810
	for <iommu@lists.linux-foundation.org>; Fri, 19 Jul 2019 11:47:19 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2tuf10w6na-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <iommu@lists.linux-foundation.org>; Fri, 19 Jul 2019 11:47:19 -0400
Received: from localhost
	by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <iommu@lists.linux-foundation.org> from <bauerman@linux.ibm.com>;
	Fri, 19 Jul 2019 16:47:18 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
	by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Fri, 19 Jul 2019 16:47:12 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
	[9.57.199.110])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x6JFlBQD50725154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 19 Jul 2019 15:47:11 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8EBAAE05C;
	Fri, 19 Jul 2019 15:47:11 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8ABCAAE05F;
	Fri, 19 Jul 2019 15:47:07 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.190.209])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
	Fri, 19 Jul 2019 15:47:07 +0000 (GMT)
References: <20190718032858.28744-1-bauerman@linux.ibm.com>
	<20190718032858.28744-6-bauerman@linux.ibm.com>
	<4a07bf75-b516-c81b-da7a-4b323e6d7e52@amd.com>
	<c85ae8ff-3b7b-88bf-6b6a-c41b159c9cc2@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: lijiang <lijiang@redhat.com>
Subject: Re: [PATCH v3 5/6] fs/core/vmcore: Move sev_active() reference to x86
	arch code
In-reply-to: <c85ae8ff-3b7b-88bf-6b6a-c41b159c9cc2@redhat.com>
Date: Fri, 19 Jul 2019 12:47:03 -0300
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19071915-0072-0000-0000-0000044B1EEB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011457; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000287; SDB=6.01234458; UDB=6.00650541;
	IPR=6.01015790; 
	MB=3.00027801; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-19 15:47:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071915-0073-0000-0000-00004CBB738B
Message-Id: <87h87igh6w.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-07-19_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1907190172
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	Mike Anderson <andmike@linux.ibm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"x86@kernel.org" <x86@kernel.org>, Ram Pai <linuxram@us.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Christoph Hellwig <hch@lst.de>
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

CkhlbGxvIExpYW5ibywKCmxpamlhbmcgPGxpamlhbmdAcmVkaGF0LmNvbT4gd3JpdGVzOgoKPiDl
nKggMjAxOeW5tDA35pyIMTnml6UgMDE6NDcsIExlbmRhY2t5LCBUaG9tYXMg5YaZ6YGTOgo+PiBP
biA3LzE3LzE5IDEwOjI4IFBNLCBUaGlhZ28gSnVuZyBCYXVlcm1hbm4gd3JvdGU6Cj4+PiBTZWN1
cmUgRW5jcnlwdGVkIFZpcnR1YWxpemF0aW9uIGlzIGFuIHg4Ni1zcGVjaWZpYyBmZWF0dXJlLCBz
byBpdCBzaG91bGRuJ3QKPj4+IGFwcGVhciBpbiBnZW5lcmljIGtlcm5lbCBjb2RlIGJlY2F1c2Ug
aXQgZm9yY2VzIG5vbi14ODYgYXJjaGl0ZWN0dXJlcyB0bwo+Pj4gZGVmaW5lIHRoZSBzZXZfYWN0
aXZlKCkgZnVuY3Rpb24sIHdoaWNoIGRvZXNuJ3QgbWFrZSBhIGxvdCBvZiBzZW5zZS4KPj4+Cj4+
PiBUbyBzb2x2ZSB0aGlzIHByb2JsZW0sIGFkZCBhbiB4ODYgZWxmY29yZWhkcl9yZWFkKCkgZnVu
Y3Rpb24gdG8gb3ZlcnJpZGUKPj4+IHRoZSBnZW5lcmljIHdlYWsgaW1wbGVtZW50YXRpb24uIFRv
IGRvIHRoYXQsIGl0J3MgbmVjZXNzYXJ5IHRvIG1ha2UKPj4+IHJlYWRfZnJvbV9vbGRtZW0oKSBw
dWJsaWMgc28gdGhhdCBpdCBjYW4gYmUgdXNlZCBvdXRzaWRlIG9mIHZtY29yZS5jLgo+Pj4KPj4+
IEFsc28sIHJlbW92ZSB0aGUgZXhwb3J0IGZvciBzZXZfYWN0aXZlKCkgc2luY2UgaXQncyBvbmx5
IHVzZWQgaW4gZmlsZXMgdGhhdAo+Pj4gd29uJ3QgYmUgYnVpbHQgYXMgbW9kdWxlcy4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBUaGlhZ28gSnVuZyBCYXVlcm1hbm4gPGJhdWVybWFuQGxpbnV4Lmli
bS5jb20+Cj4+IAo+PiBBZGRpbmcgTGlhbmJvIGFuZCBCYW9xdWFuLCB3aG8gcmVjZW50bHkgd29y
a2VkIG9uIHRoaXMsIGZvciB0aGVpciByZXZpZXcuCj4+IAo+Cj4gVGhpcyBjaGFuZ2UgbG9va3Mg
Z29vZCB0byBtZS4KPgo+IFJldmlld2VkLWJ5OiBMaWFuYm8gSmlhbmcgPGxpamlhbmdAcmVkaGF0
LmNvbT4KClRoYW5rcyBmb3IgeW91ciByZXZpZXchCgotLSAKVGhpYWdvIEp1bmcgQmF1ZXJtYW5u
CklCTSBMaW51eCBUZWNobm9sb2d5IENlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lvbW11
