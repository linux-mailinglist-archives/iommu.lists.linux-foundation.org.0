Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EFC10EF29
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 19:22:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB7E885381;
	Mon,  2 Dec 2019 18:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3gD5kiwQA+X; Mon,  2 Dec 2019 18:22:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D7AB85431;
	Mon,  2 Dec 2019 18:22:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56CAEC1DD9;
	Mon,  2 Dec 2019 18:22:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2358C087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 18:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D8764204EA
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 18:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMN1qyDPdRCu for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 18:22:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0140.hostedemail.com
 [216.40.44.140])
 by silver.osuosl.org (Postfix) with ESMTPS id A4A342002A
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 18:22:53 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 4C45D8019A9E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 18:22:51 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 31A3A18224D82;
 Mon,  2 Dec 2019 18:22:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3871:3872:3873:3874:4250:4321:5007:6119:6691:6742:7903:9010:10004:10400:10848:10967:11026:11232:11658:11914:12043:12296:12297:12438:12740:12760:12895:13069:13156:13228:13311:13357:13439:14040:14096:14097:14181:14659:14721:21080:21451:21611:21627:30012:30029:30054:30056:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: rock07_8ca00b579c85b
X-Filterd-Recvd-Size: 3045
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Mon,  2 Dec 2019 18:22:46 +0000 (UTC)
Message-ID: <3de5bad2f414fb36d1f54dd610ffeecb2c989143.camel@perches.com>
Subject: Re: [PATCH v4 8/8] iommu/vt-d: Misc macro clean up for SVM
From: Joe Perches <joe@perches.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Date: Mon, 02 Dec 2019 10:22:13 -0800
In-Reply-To: <20191202101553.079898a3@jacob-builder>
References: <1574371588-65634-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1574371588-65634-9-git-send-email-jacob.jun.pan@linux.intel.com>
 <38d4586f3aeb21bb08028525db89868acb34e9fd.camel@perches.com>
 <20191202101553.079898a3@jacob-builder>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, 2019-12-02 at 10:15 -0800, Jacob Pan wrote:
> On Thu, 21 Nov 2019 13:37:10 -0800
> Joe Perches <joe@perches.com> wrote:
> 
> > On Thu, 2019-11-21 at 13:26 -0800, Jacob Pan wrote:
> > > Use combined macros for_each_svm_dev() to simplify SVM device
> > > iteration and error checking.  
> > []
> > > diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c  
> > []
> > > +#define for_each_svm_dev(sdev, svm, d)			\
> > > +	list_for_each_entry((sdev), &(svm)->devs, list)	\
> > > +		if ((d) != (sdev)->dev) {} else
> > > +
> > >  int intel_svm_bind_mm(struct device *dev, int *pasid, int flags,
> > > struct svm_dev_ops *ops) {
> > >  	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
> > > @@ -274,15 +278,13 @@ int intel_svm_bind_mm(struct device *dev, int
> > > *pasid, int flags, struct svm_dev_ goto out;
> > >  			}
> > >  
> > > -			list_for_each_entry(sdev, &svm->devs,
> > > list) {
> > > -				if (dev == sdev->dev) {
> > > -					if (sdev->ops != ops) {
> > > -						ret = -EBUSY;
> > > -						goto out;
> > > -					}
> > > -					sdev->users++;
> > > -					goto success;
> > > +			for_each_svm_dev(sdev, svm, dev) {
> > > +				if (sdev->ops != ops) {
> > > +					ret = -EBUSY;
> > > +					goto out;
> > >  				}
> > > +				sdev->users++;
> > > +				goto success;
> > >  			}  
> > 
> > I think this does not read better as this is now a
> > for_each loop that exits the loop on the first match.
> > 
> I think one of the benefits is reduced indentation. What do you
> recommend?

Making the code intelligible for a reader.

At least add a comment describing why there is only
a single possible match.

Given the for_each name, it's odd code that only the
first match has an action.


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
