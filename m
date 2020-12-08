Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374E2D36E9
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 00:30:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C80D286DE5;
	Tue,  8 Dec 2020 23:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBBpug4xm0iR; Tue,  8 Dec 2020 23:30:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DC5E86E1A;
	Tue,  8 Dec 2020 23:30:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12B4BC013B;
	Tue,  8 Dec 2020 23:30:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9870C013B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 23:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9CA5586A9D
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 23:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbyjIj25mS_6 for <iommu@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 23:30:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 23C4886A99
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 23:30:18 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8NTJ96033962;
 Tue, 8 Dec 2020 23:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding :
 subject : to : cc : from : message-id; s=corp-2020-01-29;
 bh=9AlLRDj4NQ6VOsXiI83DjZG72/CtdEP4jRmGMopJUc8=;
 b=X+A2WizWB2Vpkmi8wutPobdd+c8SsogB7dHyYlOSUQ6YVKyXXEmsti05g4ks6doYHANe
 1yrSNen2HTuPEfl5fGcxzjTTPOnIY4cPffm+LIYtriX26+uqbMGWiBmNgQ4iglL/WI43
 JVUEuqd6aTvVkAz06v5F5EsYk7ErIO02xOTJonnB7Iw+BppPso6KL+ZMuW0pEJtTni4w
 UMk8fCCPX0Q3rH8sC5Sg8oCFsgSW2TTlScI2JiZ/tMJWGoLVaKJptwJ9zz36eNtL7mgK
 cWYxUrYVO7RUFq/n7si0a5LBIAcX6y1VSoaODAea3PvpF4+s8Xqn8/UudcJHxjUjuHVh uQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 357yqbwm7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 08 Dec 2020 23:29:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8NQmV9107408;
 Tue, 8 Dec 2020 23:27:51 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 358ksp8mxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Dec 2020 23:27:51 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B8NRjds001727;
 Tue, 8 Dec 2020 23:27:45 GMT
Received: from [192.168.86.39] (/209.6.208.110)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Dec 2020 15:27:43 -0800
Date: Tue, 08 Dec 2020 18:27:39 -0500
User-Agent: K-9 Mail for Android
In-Reply-To: <20201208230119.GG27920@zn.tnic>
References: <20201207231057.26403-1-Ashish.Kalra@amd.com>
 <20201208222220.GA27599@char.us.oracle.com> <20201208230119.GG27920@zn.tnic>
MIME-Version: 1.0
Subject: Re: [PATCH v8] swiotlb: Adjust SWIOTBL bounce buffer size for SEV
 guests.
To: Borislav Petkov <bp@alien8.de>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <6443B6DC-2C54-48E4-8207-3F2D88B82AC0@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=996
 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080148
Cc: Thomas.Lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 Jon.Grimm@amd.com, brijesh.singh@amd.com, dave.hansen@linux-intel.com,
 peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, mingo@redhat.com, luto@kernel.org,
 hpa@zytor.com, rientjes@google.com, tglx@linutronix.de, hch@lst.de
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

On December 8, 2020 6:01:19 PM EST, Borislav Petkov <bp@alien8.de> wrote:
>On Tue, Dec 08, 2020 at 05:22:20PM -0500, Konrad Rzeszutek Wilk wrote:
>> I will fix it up.
>
>So who's picking this up? If not me then I probably should have a
>detailed look at the x86 bits before it goes in...

I was planning to pick this up (got one more SWIOTLB related patch).

That said  if you have the time to take a peek at the x86 bits -  that would be awesome!


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
