Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C81E42C134C
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 19:41:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 231D4860F9;
	Mon, 23 Nov 2020 18:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVpIyoBRPLwZ; Mon, 23 Nov 2020 18:41:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 584DE84D6E;
	Mon, 23 Nov 2020 18:41:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AE45C1DA2;
	Mon, 23 Nov 2020 18:41:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C438C0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 18:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E526086FDC
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 18:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uia1T9ldAkiG for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 18:41:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 554FE86FC9
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 18:41:48 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ANIZFTd082282;
 Mon, 23 Nov 2020 18:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=TBRod9DMYmZtaGtcFOBny/67g1rpeUEvFkWSLiuvxw4=;
 b=lk9qkZ4eKX/vCffjQ/rAJ+IFXqtGsFmvf5jxkwOQ/oND7Z8VIEuTUXH9Fp2obP6DIX9x
 YpQy4LwcSV32WyS88YttX97m3z0DjIsCNkdYyM9Tpso+sViSR8mb6hrEH375ozXnT0Fr
 nM+PL7/vhTNS0/1+HZcqBKamkoYU/CUB1zjoNUb9W4tNHixO1cSfTXNRhcEAJ6xzBqP0
 38Y4dcHOucoRe9ZAy2SO3yfjUS3SDs7F17crXp4Lezbbs1UktwKUH+AdKCNTWNwcyc0S
 2EV6TUaEZigkJzfafYFLSIv517Y9dYTMssQwL8aPBEk8mr2xpQSm78LEqG6yBC3TZhtm bg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 34xtaqj98q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 23 Nov 2020 18:41:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ANIZdwj020081;
 Mon, 23 Nov 2020 18:41:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 34yx8ht5hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 18:41:32 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ANIfU1P024224;
 Mon, 23 Nov 2020 18:41:30 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Nov 2020 10:41:30 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id CB7E46A00A8; Mon, 23 Nov 2020 13:43:27 -0500 (EST)
Date: Mon, 23 Nov 2020 13:43:27 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v6] swiotlb: Adjust SWIOTBL bounce buffer size for SEV
 guests.
Message-ID: <20201123184327.GA22269@char.us.oracle.com>
References: <20201119214205.11062-1-Ashish.Kalra@amd.com>
 <20201123170647.GE15044@zn.tnic>
 <20201123175632.GA21539@char.us.oracle.com>
 <20201123180215.GG15044@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123180215.GG15044@zn.tnic>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9814
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011230122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9814
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011230122
Cc: Thomas.Lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 jon.grimm@amd.com, brijesh.singh@amd.com, dave.hansen@linux-intel.com,
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

On Mon, Nov 23, 2020 at 07:02:15PM +0100, Borislav Petkov wrote:
> On Mon, Nov 23, 2020 at 12:56:32PM -0500, Konrad Rzeszutek Wilk wrote:
> > This is not going to work for TDX. I think having a registration
> > to SWIOTLB to have this function would be better going forward.
> > 
> > As in there will be a swiotlb_register_adjuster() which AMD SEV
> > code can call at start, also TDX can do it (and other platforms).
> 
> Oh do tell. It doesn't need to adjust size?

I am assuming that TDX is going to have the same exact issue that 
AMD SEV will have.

Are you recommending to have an unified x86 specific callback
where we check if it:

 - CPUID_AMD_SEV or CPUID_INTEL_TDX is set, and
 - No vIOMMU present, then we adjust the size?

> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
